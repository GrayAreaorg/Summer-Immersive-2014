/*
 * A Function caller Example
 * This app listens to standard input for commands
 * When a command matches a corresponding
 * function in the "caller" object, it is executed.
 * Try the commands
 * 	echo
 * 	exit
 */
process.stdin.setEncoding('utf8');

//Combine a few functions to call
//Call them like this:  caller["echo"]();
var caller = {
	 exit: function() { process.exit(); },
	 echo: function() { console.log("Echo Called"); }
};

//Read from stdin
process.stdin.on('readable', function() {
	//Store the data in a chunk
  var chunk = process.stdin.read();

  if (chunk !== null) {
		//Remove the newline (\n) at the end of the chunk
	  var command = chunk.replace(/\n$/, '');

		//Does the chunk match a function in caller?
	  if (caller[command] !== undefined) {
			//Execute it
		  caller[command]();
	  } else {
			//Else > Does not exist!
		  console.log("Unknown Command: " + command);
	  }
  }
});

//Check each arguement passed to Node, if any args match
//then execute them
process.argv.forEach(function(val, index, array) {
	 if (caller[val] !== undefined) {
		  caller[val]();
	  }
});
