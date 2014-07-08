/*
 * TCP Server
 * Listens for TCP connections, and replies
 */
var net = require('net');

var tcpServer = net.createServer(function(connection) {
     console.log("Server is connected!");
     //When Server disconnects, log to console
     connection.on('end', function() {
         console.log("Server disconnected");
     });
     //Let's say hello!
     connection.write("Hello!\r\n");
     //...and listen for a response!
     connection.on("data", function(d) {
         console.log("Data: " + d.toString());
     });
});

//Bind to a specific port
tcpServer.listen(8888, function() {
     console.log("Binding to port 8888");
});
