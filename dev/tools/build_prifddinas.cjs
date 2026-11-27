// Original BWM compositor: decoded game-cache data and game sprites only.
// No third-party map renderer or rendered tiles are used by this tool.
const fs=require('fs/promises'),path=require('path'),sharp=require(process.env.BWM_SHARP_MODULE||'sharp');
async function build(project,input,out){
 const data=JSON.parse(await fs.readFile(path.join(input,'data.json'))),parts=[];
 const colour=c=>c&&!(c[0]===255&&c[1]===0&&c[2]===255)?`rgb(${c.join(',')})`:null;
 let floors=0,walls=0,scenery=0;
 for(const region of data.regions){
  for(let x=0;x<64;x++)for(let z=0;z<64;z++){
   const t=region.tiles[4096+x*64+z],px=(region.x*64+x-2048)*4,py=(3455-region.z*64-z)*4;
   const under=colour(data.underlays[t.underlay]?.color),o=data.overlays[t.overlay],over=colour(o?.secondary_colour||o?.color);
   if(under){parts.push(`<rect x="${px}" y="${py}" width="4" height="4" fill="${under}"/>`);floors++;}
   if(over){
    const shape=t.shape||0;
    if(shape<4)parts.push(`<rect x="${px}" y="${py}" width="4" height="4" fill="${over}"/>`);
    else {const triangles=['0,0 4,0 0,4','0,0 4,0 4,4','4,0 4,4 0,4','0,0 4,4 0,4'];parts.push(`<polygon transform="translate(${px},${py})" points="${triangles[shape%4]}" fill="${over}"/>`);}
    floors++;
   }
  }
 }
 const sprites=[];
 for(const region of data.regions)for(const loc of region.locs){
  if(loc.plane!==1)continue;
  const x=(region.x*64+loc.x-2048)*4,y=(3455-region.z*64-loc.y)*4;
  if(data.sprites[loc.mapscene]){
   const file=path.join(input,data.sprites[loc.mapscene]),m=await sharp(file).metadata();
   const w=(loc.rotation%2?loc.length:loc.width)*4,h=(loc.rotation%2?loc.width:loc.length)*4;
   const left=Math.round(x+(w-m.width)/2),top=Math.round(y+4-(h+m.height)/2);
   if(left>=0&&top>=0&&left+m.width<=1024&&top+m.height<=768){sprites.push({input:file,left,top});scenery++;}
  }else if(loc.type>=0&&loc.type<=3||loc.type===9){
   const edges=[`${x},${y+4} ${x},${y}`,`${x},${y} ${x+4},${y}`,`${x+4},${y} ${x+4},${y+4}`,`${x+4},${y+4} ${x},${y+4}`];
   const line=loc.type===9?`${x},${y} ${x+4},${y+4}`:edges[loc.rotation%4];
   parts.push(`<polyline points="${line}" stroke="#d0cbbb" fill="none" stroke-width="1"/>`);walls++;
  }
 }
 const svg=Buffer.from(`<svg xmlns="http://www.w3.org/2000/svg" width="1024" height="768">${parts.join('')}</svg>`);
 await fs.mkdir(out,{recursive:true});
 // Existing ground-floor artwork supplies the coast and surrounding forest.
 const image=await sharp(path.join(project,'resources/area_maps/a_231.png')).resize(1024,768).composite([{input:svg},...sprites]).png().toBuffer();
 await fs.writeFile(path.join(out,'prifddinas.png'),image);
 const report={area:231,bounds:{x:2048,z:3264,w:256,h:192},floor:1,floorPaints:floors,walls,scenerySprites:scenery};
 await fs.writeFile(path.join(out,'report.json'),JSON.stringify(report,null,2));return report;
}
module.exports={build};
if(require.main===module)build(...process.argv.slice(2).map(p=>path.resolve(p))).then(console.log).catch(e=>{console.error(e);process.exitCode=1});
