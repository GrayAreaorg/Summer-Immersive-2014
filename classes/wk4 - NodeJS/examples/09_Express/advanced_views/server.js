var express = require('express');

var app = express();

var items = [
  {
    "name": "item_1",
    "description": "This is the First Item"
  },
  {
    "name": "item_2",
    "description": "This is the Second Item"
  },
];

app.get('/', function(req, res) {
  res.render('index.ejs', { "items": items});
});

app.get('/items/:item', function(req, res) {
  var thisItem = items.filter(function(chosen) {
    return(chosen.name === req.params.item);
  });
  if (thisItem.length > 0) {
    thisItem = thisItem[0];
    res.render('item.ejs', {"item": thisItem})
  } else res.status(404).render('error.ejs');
})

app.get('/*', function(req, res) {
  res.status(404).render('error.ejs');
})

app.listen(3000);
