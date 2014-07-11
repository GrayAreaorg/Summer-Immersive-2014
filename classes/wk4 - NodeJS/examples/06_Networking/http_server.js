/*
 * HTTP Server
 * The simplest of web servers
 */

 var http = require('http');

 var server = http.createServer(function (req,res) {
       //Write the Header
       res.writeHead(200, {'Content-Type': 'text/plain'});
       //Begin writing a response
       res.write("Request for:\n");
       res.write("URL: " + req.url + "\n");
       //Complete the response
       res.end('This is a web server!\n');
 }).listen(8000)
