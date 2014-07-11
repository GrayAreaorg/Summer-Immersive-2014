/*
 * Piping
 * Readable and Writeable Streams in Node are able to pipe
 * between data between each other.  This example takes
 * a Readable streams (stdin), and pipes it to a file.
 */

var fs = require('fs');

//STDIN >> Read in a chunk >> Write that chunk to File
process.stdin.pipe(fs.createWriteStream("stdin.log"));
