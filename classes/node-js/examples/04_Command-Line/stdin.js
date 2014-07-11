/*
 * Reading from Standard Input
 * Using the process library's stdin object,
 * your node application can interact with
 * the command-line
 *
 */

//Needed to read in from stdin
process.stdin.setEncoding('utf8');

//When stdin has "readable" data
process.stdin.on('readable', function(err) {
  //Read in
  var chunk = process.stdin.read();
  //If the chunk read in isn't null...
  if (chunk !== null) {
    //Write it to the console
	  console.log("Echo: " + chunk);
  }
});
