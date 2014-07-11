/*
 * The Event Model
 * In addition to the Callback Model, NodeJS has another
 * method for writing non-blocking code: The Event Model
 * They are very similar in the way the provide callback
 * functions, but differ slightly in how many callbacks
 * are returned, and when they are returned.
 */

 //The Callback Method
 //One drawback of the Callback Method is that you have to wait
 //for the function to complete before returning all values.

 //Create an array, fill it with five values, then return it
 function callbackMethod(callback) {
     args = [];
     console.log("CallbackMethod started");
     for (i=0; i < 5; i++) {
         var rand = Math.floor(Math.random() * 10000);
         args.push(rand);
     }
     console.log("For Loop Completed");
     callback(null,args);
 }

//The callback will have all 5 values
 callbackMethod(function(err, args) {
     console.log("Args " + args);
 })

 //The Event Method
 //When using the Event method, you 'emit' an event upon each
 //event that your calling function needs to know about.
 //We can recreate the function above using the Event Method.

var EventEmitter = require('events').EventEmitter;

console.log("---------------------------------------------");

function eventMethod() {
    var e = new EventEmitter();
    process.nextTick(function() {
      console.log("EventMethod started");
      for (i=0; i < 5; i++) {
          var rand = Math.floor(Math.random() * 10000);
          //Emit each random number as they are created
          e.emit('data', rand);
      }
      //Once all five are emitted, return "For Loop Completed"
      e.emit('end', "For Loop Completed");
    });

    //Return the EventEmitter for later use
    return(e);
}

//Start the EventMethod, and store it in the variable em
var em = eventMethod();
//Listen to the "data" method
em.on("data", function(d) {
    console.log("Data: " + d);
});
//Listen to the "end" method
em.on("end", function(d) {
    console.log(d);
});
