// Original BWM full-surface colour pass over decoded local-cache ground data.
// Each c_X_Z.json includes its mapped source cells plus a sixteen-tile sampling halo.
const fs=require('node:fs/promises'),path=require('node:path');
const {rebuild}=require('./rebuild_ground_blending.cjs');
async function build(project,dataDir,outputDir){
 const reports=[];
 for(const file of (await fs.readdir(dataDir)).filter(f=>/^c_-?\d+_-?\d+\.json$/.test(f)).sort()){
  const report=await rebuild(project,path.join(dataDir,file),outputDir);reports.push(report);
 }
 const result={method:'Chroma-weighted terrain-underlay HSL blending, radius 5, mapped sampling halo 16',
  chunksAudited:reports.length,chunksChanged:reports.reduce((n,r)=>n+r.tiles.length,0),
  pixelsChanged:reports.reduce((n,r)=>n+r.pixelsChanged,0),tiles:reports.flatMap(r=>r.tiles)};
 await fs.writeFile(path.join(outputDir,'world_report.json'),JSON.stringify(result,null,2)+'\n');return result;
}
module.exports={build};
if(require.main===module)build(...process.argv.slice(2).map(p=>path.resolve(p)))
 .then(r=>console.log(JSON.stringify({chunksAudited:r.chunksAudited,chunksChanged:r.chunksChanged,pixelsChanged:r.pixelsChanged})))
 .catch(e=>{console.error(e);process.exitCode=1});
