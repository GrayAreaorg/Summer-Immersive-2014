/*
 * The Callback design in Node
 * Node is built on a non-blocking model, and one
 * popular method is the Callback design.  Instead
 * of performing actions in sequence, waiting for
 * each step to complete, a Callback function is
 * supplied which executes when the function completes
 *
 */

//The Blocking Method
//This method prevents each subsequent step from executing, or "Blocks"
/*
var connection = getConnection();
[[WAITING...]]
var results = connection.getResults(); -- Wait for the connection, then execute
[[WAITING...]]
var output = results.toOutput();  --Waits till results complete, then executes
*/

//The Callback Method
//This example has a function which waits for a given period of time, then
//returns a string with how long it waited

//Create a function which takes a time value, and returns a callback
function waitingFunction(time, callback) {
    console.log("Starting to wait "+ time + " ms");
    var timeout = setTimeout(function() {
        callback(null, "Waited " + time + " ms");
    }, time);
}

//The callback arguement is passed as an anonymous function
//This function is called from within the waitingFunction once it completes
waitingFunction(10000, function(err, response){
    console.log(response);
});
//If we were blocking, this function would not start until the first function
//completes.  However, each fire off in succession, and this function returns
//first!
waitingFunction(5000, function(err, response){
    console.log(response);
});
