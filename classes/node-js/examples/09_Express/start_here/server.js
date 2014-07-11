

var express = require('express');

var app = express();

app.get("/hello", function(req,res) {
  res.send('<h1>Hello</h1>');
});

app.get("/hello/:name", function(req,res) {
  res.send('<h1>Hello ' + req.params.name + '</h1>');
});

app.get('/*', function(req,res) {
  res.send('Why not say <a href="/hello">Hello</a>');
})

app.listen(3000);
