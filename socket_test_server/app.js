const net = require('net');

const server = net.createServer();

var HOST = '127.0.0.1';
var PORT = 6969;

server.on('connection', sock => {
  console.log('CONNECTED: ' + sock.remoteAddress +':'+ sock.remotePort);
  // Add a 'data' event handler to this instance of socket
  sock.on('data', data => {
    console.log('DATA ' + sock.remoteAddress + ': ' + data);
  });
  // Add a 'close' event handler to this instance of socket
 sock.on('close', data => {
   console.log('CLOSED: ' + sock.remoteAddress +' '+ sock.remotePort);
 });
});

server.listen(PORT, HOST, () => {
  var address = server.address();
  var port = address.port;
  var family = address.family;
  var ipaddr = address.address;
  console.log('Server is listening at port: ' + port);
  console.log('Server ip : ' + ipaddr);
  console.log('Server is IP4/IP6 : ' + family);
});
