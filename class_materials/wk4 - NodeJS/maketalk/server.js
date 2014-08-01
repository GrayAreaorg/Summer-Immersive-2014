//load express lib
var express = require('express');
var bodyParser = require('body-parser');
var server = express.createServer();
server.use(bodyParser.urlencoded());
var exec = require('child_process').exec;

server.get('/', function(request, response) {
  response.render("index.ejs", "");
});

server.post('/',function(request,response){
  var say = request.body.say;
  var voice = request.body.voice;
  console.log(request.body.say + " : " + request.body.description + " : " + request.body.voice);
  //response.render("index.ejs", {"todos": todos});
  exec('say ' + "-v " + request.body.voice + " " + request.body.say, function(err, stdout, stderr) {
  console.log(stdout);
  });
});

//Point server to public folder
server.use(express.static("public"));

server.listen(8000);
