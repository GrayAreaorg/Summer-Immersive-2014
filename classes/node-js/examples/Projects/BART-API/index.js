/*
 *   BART Marquee
 *
 *
 */

 //Global Requirements
var express = require('express');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io')(server);

 //Bart Modules
 var bart = require("./bartjs/bartClient");


 //App Entry point
var port = 3000;
server.listen(port, function () {
  console.log('Server listening at port %d', port);
});

// Express Routing
app.use(express.static(__dirname + '/site'));


io.on('connection', function (socket) {

  socket.emit("etd", {message: "Connected to BartChat!"});
  socket.on("chat message", function(data) {
    if (data) {
      command = data.split(" ")
      if (command[0] == "join") {
        socket.join(command[1]);
        socket.emit("etd", { message: "Joining room " + command[1]});
      }
      if (command[0] == "leave") {
        socket.leave(command[1]);
        socket.emit("etd", { message: "Leaving room " + command[1]});
      }
    }

  })

});

//Initiate BART Client
var bartClient = new bart.bartClient();
bartClient.on("etd", function(result) {
  console.log("Updated at " + result.root.date + " " + result.root.time);
  stations = result.root.station;
  for (obj in stations) {
    stationName = stations[obj]["name"][0];
    stationAbrv = stations[obj]["abbr"][0]
    etds = stations[obj]["etd"];
    for (dest in etds) {
      est = etds[dest]["estimate"];
      if (est[0]["minutes"] == "Leaving") {
        resp = etds[dest]["destination"] + " train is leaving the " + stationName + " station now!";
      } else {
        resp = etds[dest]["destination"] + " train is leaving the " + stationName + " station in " + est[0]["minutes"] ;
      }
      io.to("all").emit("etd", { message: resp});
      io.to(stationName).emit("etd", { message: resp});
      io.to(stationAbrv).emit("etd", { message: resp});
    }

  }
});
setInterval(function() { bartClient.getETD('all') },   60000);
bartClient.getETD('all');
