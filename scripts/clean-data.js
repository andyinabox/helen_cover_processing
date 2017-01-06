const fs = require('fs');

const dataPath = __dirname + '/../data/data.json';
fs.writeFileSync(dataPath, JSON.stringify(require(dataPath).rows.map(r => r.value)));

const constantsPath = __dirname + '/../data/constants.json';
fs.writeFileSync(constantsPath, JSON.stringify(require(constantsPath).rows[0].value, null, ' '));
