const fs=require('node:fs/promises');
const path=require('node:path');
const sharp=require(process.env.BWM_SHARP_MODULE||'sharp');

// Original BWM terrain-colour pass. The input is decoded local cache data, not
// another map's imagery. Only pixels matching the old bare-ground colour change.
function rgbToHsl(rgb){
 const [r,g,b]=rgb.map(v=>v/255),hi=Math.max(r,g,b),lo=Math.min(r,g,b),d=hi-lo,l=(hi+lo)/2;
 if(d===0)return {h:0,s:0,l,w:0};
 let h=hi===r?(g-b)/d+(g<b?6:0):hi===g?(b-r)/d+2:(r-g)/d+4;
 return {h:h/6,s:d/(1-Math.abs(2*l-1)),l,w:d};
}
function hslToRgb(h,s,l){
 const c=(1-Math.abs(2*l-1))*s,t=h*6,x=c*(1-Math.abs(t%2-1)),m=l-c/2;
 const values=t<1?[c,x,0]:t<2?[x,c,0]:t<3?[0,c,x]:t<4?[0,x,c]:t<5?[x,0,c]:[c,0,x];
 return values.map(v=>Math.max(0,Math.min(255,Math.round((v+m)*255))));
}
function makeField(data,radius=5){
 const bounds=data.cells.reduce((b,c)=>({x0:Math.min(b.x0,c.x),x1:Math.max(b.x1,c.x),z0:Math.min(b.z0,c.z),z1:Math.max(b.z1,c.z)}),{x0:Infinity,x1:-Infinity,z0:Infinity,z1:-Infinity});
 const width=bounds.x1-bounds.x0+1,height=bounds.z1-bounds.z0+1,stride=width+1;
 const tables=Array.from({length:6},()=>new Float64Array((width+1)*(height+1)));
 const colors=new Map();
 for(const [id,underlay]of Object.entries(data.underlays)){
  const rgb=underlay.color;if(!rgb||rgb[0]===255&&rgb[1]===0&&rgb[2]===255)continue;
  colors.set(+id,rgbToHsl(rgb));
 }
 for(const cell of data.cells){
  const p=colors.get(cell.underlay);if(!p)continue;
  const at=(cell.z-bounds.z0+1)*stride+cell.x-bounds.x0+1;
  const a=p.h*2*Math.PI,values=[Math.cos(a)*p.w,Math.sin(a)*p.w,p.w,p.s,p.l,1];
  for(let i=0;i<6;i++)tables[i][at]=values[i];
 }
 for(const table of tables)for(let y=1;y<=height;y++){
  let row=0;for(let x=1;x<=width;x++){const at=y*stride+x;row+=table[at];table[at]=row+table[at-stride];}
 }
 function sums(x,z){
  const left=Math.max(0,x-bounds.x0-radius),right=Math.min(width,x-bounds.x0+radius+1);
  const bottom=Math.max(0,z-bounds.z0-radius),top=Math.min(height,z-bounds.z0+radius+1);
  return tables.map(t=>t[top*stride+right]-t[top*stride+left]-t[bottom*stride+right]+t[bottom*stride+left]);
 }
 return {bounds,sample(x,z){const [hc,hs,w,s,l,n]=sums(x,z);if(!n)return null;
  const h=w?((Math.atan2(hs,hc)/(2*Math.PI))%1+1)%1:0;
  return hslToRgb(h,s/n,l/n);
 }};
}
async function rebuild(project,dataFile,outputDir){
 const data=JSON.parse(await fs.readFile(dataFile,'utf8')),field=makeField(data);
 const protectedCells=new Set(data.protectedCells||[]);
 const groups=new Map();
 for(const c of data.cells){
  if(c.flags&16)continue; // preserve water and its map-specific treatment
  const cx=Math.floor(c.x/256),cz=Math.floor(c.z/256),key=`c_${cx}_${cz}`;
  // Full-map inputs include a halo for colour sampling, but write only their owner chunk.
  if(data.targetChunk&&key!==data.targetChunk)continue;
  if((data.exclusions||[]).some(b=>c.x>=b.x&&c.x<b.x+b.w&&c.z>=b.z&&c.z<b.z+b.h))continue;
  if(!groups.has(key))groups.set(key,{cx,cz,cells:[]});groups.get(key).cells.push(c);
 }
 await fs.mkdir(outputDir,{recursive:true});
 const report={method:'BWM chroma-weighted hue with averaged saturation/lightness over cached terrain underlays',radius:5,tiles:[],pixelsChanged:0,pixelsPreserved:0};
 for(const [key,group]of groups){
  const file=path.join(project,'resources/surface_chunks',key+'.png');let img;
  try{img=await sharp(file).ensureAlpha().raw().toBuffer({resolveWithObject:true});}catch{continue;}
  const bytes=img.data,original=Buffer.from(bytes);let changed=0,preserved=0;
  const groundPalettes=new Map();
  const packedRGB=(bytes,at)=>(bytes[at]<<16)|(bytes[at+1]<<8)|bytes[at+2];
  for(const c of group.cells){
   if(c.overlay||c.nxtOverlay||protectedCells.has(`${c.x}:${c.z}`))continue;
   const px=(c.x-group.cx*256)*4,py=(255-(c.z-group.cz*256))*4,histogram=new Map();
   for(let dy=0;dy<4;dy++)for(let dx=0;dx<4;dx++){const k=packedRGB(original,((py+dy)*1024+px+dx)*4);histogram.set(k,(histogram.get(k)||0)+1);}
   const mode=[...histogram].sort((a,b)=>b[1]-a[1])[0];if(!mode||mode[1]<10)continue;
   const rgb=[mode[0]>>>16,(mode[0]>>>8)&255,mode[0]&255],a=rgbToHsl(rgb),b=rgbToHsl(data.underlays[c.underlay].color),dh=Math.abs(a.h-b.h);
   if(Math.min(dh,1-dh)>=.12||Math.abs(a.s-b.s)>=.5||a.l<=.05)continue;
   if(!groundPalettes.has(c.underlay))groundPalettes.set(c.underlay,new Set());groundPalettes.get(c.underlay).add(mode[0]);
  }

  for(const c of group.cells){
   const color=field.sample(c.x,c.z);if(!color)continue;
   // Feather only the outer boundary of the extracted data region. This is not
   // image blurring: terrain features never participate in ground-colour mixing.
   const border=Math.min(c.x-field.bounds.x0,field.bounds.x1-c.x,c.z-field.bounds.z0,field.bounds.z1-c.z);
   const strength=Math.max(0,Math.min(1,(border-5)/10));if(!strength)continue;
   const px=(c.x-group.cx*256)*4,py=(255-(c.z-group.cz*256))*4;
   // Historical tile exports contain more than one baked-lighting palette.
   // For bare ground without scenery, identify its actual flat fill locally.
   // Overlay cells retain strict cached-colour matching to preserve paths.
   let flat=null;
   if(!c.overlay&&!c.nxtOverlay&&!protectedCells.has(`${c.x}:${c.z}`)){
    const histogram=new Map();
    for(let dy=0;dy<4;dy++)for(let dx=0;dx<4;dx++){
     const at=((py+dy)*1024+px+dx)*4,key=[...original.subarray(at,at+3)].join(',');histogram.set(key,(histogram.get(key)||0)+1);
    }
    const mode=[...histogram].sort((a,b)=>b[1]-a[1])[0];
    if(mode&&mode[1]>=6){
     const rgb=mode[0].split(',').map(Number),a=rgbToHsl(rgb),b=rgbToHsl(data.underlays[c.underlay].color);
     const dh=Math.abs(a.h-b.h),hueDistance=Math.min(dh,1-dh);
     if(hueDistance<.12&&Math.abs(a.s-b.s)<.5&&a.l>.05)flat=rgb;
    }
   }
   for(let dy=0;dy<4;dy++)for(let dx=0;dx<4;dx++){
    const at=((py+dy)*1024+px+dx)*4;
    // Pale building outlines and water are foreground artwork, never ground fill.
    const r=original[at],g=original[at+1],b=original[at+2];
    if((r>210&&g>210&&b>210)||(b>r+15&&b>g+10)){preserved++;continue;}
    const distance=Math.max(...c.oldRGB.map((v,i)=>Math.abs(bytes[at+i]-v)));
    const flatDistance=flat?Math.max(...flat.map((v,i)=>Math.abs(original[at+i]-v))):Infinity;
    const knownGround=!c.overlay&&!c.nxtOverlay&&groundPalettes.get(c.underlay)?.has(packedRGB(original,at));
    if(distance>1&&flatDistance>1&&!knownGround){preserved++;continue;}
    for(let i=0;i<3;i++)bytes[at+i]=Math.round(original[at+i]*(1-strength)+color[i]*strength);
    if(!bytes.subarray(at,at+3).equals(original.subarray(at,at+3)))changed++;
   }
  }
  if(changed){await sharp(bytes,{raw:img.info}).png().toFile(path.join(outputDir,key+'.png'));report.tiles.push({key,changed,preserved});}
  report.pixelsChanged+=changed;report.pixelsPreserved+=preserved;
 }
 await fs.writeFile(path.join(outputDir,'blend_report.json'),JSON.stringify(report,null,2)+'\n');
 return report;
}
module.exports={rgbToHsl,hslToRgb,makeField,rebuild};
if(require.main===module)rebuild(path.resolve(process.argv[2]),path.resolve(process.argv[3]),path.resolve(process.argv[4]))
 .then(r=>console.log(JSON.stringify({tiles:r.tiles.length,pixelsChanged:r.pixelsChanged,pixelsPreserved:r.pixelsPreserved})))
 .catch(e=>{console.error(e);process.exitCode=1});
