//Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/

//var dispatcher = new WebSocketRails('localhost:3000/websocket');
var dispatcher = new WebSocketRails('50.116.32.32:3000/websocket');

dispatcher.on_open = function(data) {
  console.log('Connection has been established: ', data);
  // You can trigger new server events inside this callback if you wish.
}

var channel = dispatcher.subscribe('messages');

channel.bind('new_message', function(data) {
  console.log('channel event received: ' + data["body"]);
  update_message_in_ui(data["username"], data["body"]);
});

function send_group_message_channel_method() {
  var username = $('input#username').val();
  var body = $('input#body').val();
  var message = {
    username: username,
    body: body
  }
  channel.trigger('new_message', message);
  $('input#username').val('');
  $('input#body').val('');
}

function send_group_message_event_router_method() {
  var username = $('input#username1').val();
  var body = $('input#body1').val();
  var message = {
    username: username,
    body: body
  }
  dispatcher.trigger('new_message', message);
  $('input#username1').val('');
  $('input#body1').val('');
}

function update_message_in_ui(name, body) {
  $('div.messages').append("<div class='well well-sm'><b>" + name+" : </b>"+ body + " </div>");
}

var tests_channel = dispatcher.subscribe('tests');


tests_channel.bind('android', function(data) {
  console.log('channel event received: ' + data["count"]);
  $(".android-count").html(data["count"]);
  $(".android-batch").html(data["batch"]);
});

tests_channel.bind('ios', function(data) {
  console.log('channel event received: ' + data["count"]);
  $(".ios-count").html(data["count"]);
  $(".ios-batch").html(data["batch"]);
})
