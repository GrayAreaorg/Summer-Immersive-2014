/*
 * Body Parser Example
 * In this example, we will parse a post request to `/post`
 * and display the results back to the client
 *
 */

//Load the connect, body-parser, and serve-static modules
var connect = require('connect');
var bodyParser = require('body-parser');
var serveStatic = require('serve-static');

var app = connect();

// parse application/x-www-form-urlencoded, ie form posts
app.use(bodyParser.urlencoded());

//Serve html files from public folder
app.use(serveStatic('public'));

//If request doesn't match files in public folder...
//And request goes to /post, respond with "name"
//parameter form post request
app.use(function (req, res) {
  if (req.url === "/post") {
    res.end("Hello " + req.body.name + "!")
  };
})

app.listen(3000);
