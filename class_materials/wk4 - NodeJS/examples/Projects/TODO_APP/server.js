

var express = require('express');
var bodyParser = require('body-parser');
var app = express();
app.use(bodyParser.urlencoded());


var todoList = [
  {
    "name": "todo1",
    "description": "first todo"
  }
];

app.get('/', function(req, res){
  res.render('index.ejs', { "todoList": todoList})
});
app.get('/view/:name', function(req, res) {
  var data = todoList.filter(function(todo){
    return(todo.name === req.params.name);
  });
  if (data.length > 0) {
    res.render('todo.ejs', {"name": data[0].name, "description": data[0].description});
  } else res.status(400).end("Fail :( ");

})
app.get('/add', function(req,res) {
  res.render('add.ejs');
})
app.post('/add', function(req, res) {
  todoList.push({"name": req.body.name, "description": req.body.description});
  res.render("added.ejs", {
    name: req.body.name,
    description: req.body.description
  });
});
app.get('/delete/:name', function(req, res) {
  if (req.params.name !== null) {
    for(var i = 0; i < todoList.length; i++){
      if (todoList[i].name === req.params.name) {
        todoList.splice(i,1);
        res.redirect("/");
      }
    }
    res.status(400).end("FAIL!");
  } else res.status(400).end("FAIL!");
});
app.get('/*', function(req, res) {
  res.status(400).end("FAIL!");
});

app.listen(3000);
