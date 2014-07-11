/*
 * Reading command line arguments:
 * 
 * process.argv contains all command-line arguements
 * passed to the node app
 * 
 * The command > node process.js arg1 arg2
 * produces:
 * 	0: node
 * 	1: /path/to/process.js
 * 	2: arg1
 * 	3: arg2
 */

process.argv.forEach(function(val, index, array) {
	console.log(index + ': ' + val);
});
