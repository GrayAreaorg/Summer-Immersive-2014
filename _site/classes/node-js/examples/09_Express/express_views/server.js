

var express = require('express');

var app = express();

app.get('/', function(req, res) {
  res.render('index.ejs', {title: "Hello"});
});

app.get("/hello", function(req,res) {
  res.send('<h1>Hello</h1>');
});

app.get("/hello/:name", function(req,res) {
  res.send('<h1>Hello ' + req.params.name + '</h1>');
});

app.get('/*', function(req, res) {
  res.status(404).render('error.ejs');
})

app.listen(3000);
