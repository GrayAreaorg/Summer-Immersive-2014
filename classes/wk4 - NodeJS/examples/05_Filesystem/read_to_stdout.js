/*
 * Read to STDIN
 * This code mimics what the cat command does in *nix
 * It looks for words.txt, reads the file, then echos to stdout
 */


var fs = require('fs');

var filename = __dirname+"/words.txt";

var readStream = fs.createReadStream(filename);

readStream.on('open', function () {
  readStream.pipe(process.stdout);
});

readStream.on('error', function(err) {
  console.log(err);
});
