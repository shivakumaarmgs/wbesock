 //Place all the behaviors and hooks related to the matching controller here.
 //All this logic will automatically be available in application.js.
 //You can use CoffeeScript in this file: http://coffeescript.org/

//var dispatcher = new WebSocketRails('localhost:3000/websocket');
var dispatcher = new WebSocketRails('5a8d176b.ngrok.com/websocket');

dispatcher.on_open = function(data) {
  console.log('Connection has been established: ', data);
  // You can trigger new server events inside this callback if you wish.
}

var channel = dispatcher.subscribe('messages');

channel.bind('new_message', function(data) {
  console.log('channel event received: ' + data["from_id"]);
  console.log('channel event received: ' + data["to_id"]);
  console.log('channel event received: ' + data["body"]);
});
