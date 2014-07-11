/*
 * Reading from the Filesystem
 * This demos the use of
 * fs.exists - Does a file exist?
 * fs.writeFile - Create a new file
 * fs.unlink - Delete a file
 */

var fs = require('fs');

 //Does the datafile exist?
 fs.exists("./datafile", function(exists) {
     console.log(exists ? "Exists!" : "Doesn't exist :(");

     //No?  Well, let's create it!
     fs.writeFile('./datafile', 'Some Data', function (err) {
         if (err) throw err;
         console.log('Saved datafile!');

         //What's in the datafile?
         var data = fs.readFileSync("./datafile", "utf8");
           console.log("Datafile contains: " + data);

         //Ok, let's delete it
         fs.unlink('./datafile', function (err) {
             if (err) throw err;
             console.log('Deleted datafile!');
         });
     });

 })
