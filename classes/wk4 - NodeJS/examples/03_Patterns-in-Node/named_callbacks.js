/*
 * Named Callbacks
 * In the callback method, you can either use an
 * anonymous functions, or a named function that
 * you can reuse.
 *
 */

 //Create a function which takes a time value, and returns a callback
 function waitingFunction(time, callback) {
     console.log("Starting to wait "+ time + " ms");
     var timeout = setTimeout(function() {
         callback(null, "Waited " + time + " ms");
     }, time);
 }

//Callback function to be re-used
function writeToConsole(err, response) {
    console.log(response);
};

//Instead of using an anonymous function, we use the writeToConsole function
waitingFunction(10000, writeToConsole);

waitingFunction(5000, writeToConsole);
