/*
 * BARTJS - Interact with BART API using NodeJS and Request
 * Pings the following endpoint: http://api.bart.gov/api/etd.aspx?cmd=etd&orig=all&key=MW9S-E7SL-26DU-VV8V
 *
 */

var request = require("request");
var fs = require("fs");
var util = require("util");
var xml2js = require("xml2js")
var events = require("events");
var parser = new xml2js.Parser();

var bartClient = function() {
  this.BARTbaseURL = "http://api.bart.gov/api/";
  this.apiKey = "&key=MW9S-E7SL-26DU-VV8V";
  events.EventEmitter.call(this)
}
util.inherits(bartClient, events.EventEmitter);


bartClient.prototype.getETD = function(station) {
  var that = this;
  var etdURL = this.BARTbaseURL + "etd.aspx?cmd=etd"
  if (station) {
    etdURL = etdURL + "&orig="+ station;
  }
  etdURL = etdURL + this.apiKey;

  request(etdURL, function(error, response, body){

    if (!error && response.statusCode == 200) {
      parser.parseString(body, function(err, result){
        that.emit("etd", result);
      });
    }

  });
}





//Exports
module.exports.bartClient = bartClient;
/*


*/
