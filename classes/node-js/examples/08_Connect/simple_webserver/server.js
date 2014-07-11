/*
 * Connect Example
 * In order to run this example, you will need to run `npm install`
 * in the simple_webserver folder
 *
 */

//Load connect module with serveStatic middleware
var connect = require('connect');
var serveStatic = require('serve-static');
//Initialize connect app
var app = connect();

//Set up a static webserver pointing to the `public` folder
app.use(serveStatic('public'));

//If no file matches url, return "Error"
app.use(function(req,res){
  res.end("Error!");
});

//Start connect app on port 3000
app.listen(3000);
