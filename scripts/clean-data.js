const fs = require('fs');
var argv = process.argv.slice(2);
var file = argv[0];

const dataPath = __dirname + '/../data/'+file;
fs.writeFileSync(dataPath, JSON.stringify(require(dataPath).rows.map(r => r.value)));