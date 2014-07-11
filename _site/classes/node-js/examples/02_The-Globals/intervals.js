/*
 * intervals.js
 * Intervals and Timeouts in javascript
 */

//******************************************************************************//
/*
 * setInterval(callback, time) : repeats the callback function every *time* ms
 * clearInterval(timer) : stops a corresponding setInterval callback
 */

var repeatingFunction = setInterval(function() {
	console.log("Ping");
},1000);

//******************************************************************************//

//******************************************************************************//
/*
 * setTimeout(callback, time) : delays the callback function for *time* ms
 * clearTimeout(timer) : stops a corresponding setTimeout callback
 */
