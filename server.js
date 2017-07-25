var express = require('express');
var path = require('path');
var fs = require('fs');
var app = express()
var http = require('http').Server(app);
var io = require('socket.io')(http);
var watch = require('watch');

app.use(express.static('public'))
var publicDir = path.join(__dirname, 'public')


app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

sockets = [];
io.on('connection', function(socket){
//  console.log('a user connected');
  sockets.push(socket);

  io.on('disconnection', () => {
    index = sockets.indexOf(socket);
    socket.splice(index, 1);
//    console.log('disconnected');
  })
});

port = 8080 
http.listen(port, function(){
  console.log('listening on ' + port);
});

watch.watchTree(__dirname + '/public', function (f, curr, prev) {
  if (typeof f === 'string' && f.endsWith('htop.html')) {
    fs.readFile(__dirname + '/public/htop.html', 'utf8', (err, data) => {
      if (err) {
        console.log(err);
        return;
      }
      sockets.forEach(s => {
          s.emit('fileUpdate', data);
      })
    });
  }
});
