$(document).on('turbolinks:load', function () {
  document.getElementById("defaultOpen").click();
  
  // load each sender messages without refreshing page
  $('td.choice.text-center').on('click', openMessages)

  // prevent redirecting after creating a new message
  $('form#new_message').submit(function (event) {
    //prevent form from submitting the default way
    event.preventDefault();
    // Rescue preventDefault
    var values = $(this).serialize();
    var posting = $.post('/messages', values);
    posting.done(function (data) {
      // Handle response
      let html = '<div class="row popup message"><p><strong>' + data.user.username + '</strong>: ' + data.content + '</p>' +
        '<p class="msgtime" style="font-size: 10px">' + data.posted_at + '</p></div>';
      $('div.messagedivs').append(html);
      // debugger;
    });
  })
})

function Message(message_hash) {
  this.id = message_hash["id"];
  this.content = message_hash["content"];
  this.userimg = message_hash["user"]["image"];
  this.username = message_hash["user"]["name"];
  this.posted_at = message_hash["posted_at"];
}

function displayMessage() {
  document.getElementById("popupMessage").innerHTML = message;
  $.get('/all_messages', function (message) {
    debugger;
    var list = $('div#games').text()
    for (var i = 0; i < games.data.length; i++) {
      let date = new Date(games.data[i].attributes['updated-at']);
      let update = date.toUTCString();
      let id = games.data[i].id;
      if (!list.includes(id)) {
        var html = '<button data-id="' + id + '">Game: ' + id + ' - Updated at: ' + update + '</button><br>';
        $('div#games').append(html);
        turn = turn_count();
        $(`button[data-id=${id}]`).on('click', showBoard)
      }
    }
  })
}

function openMessages() {
  alert("JO")
  debugger;
  // $(td).removeClass('active');
  // $(td).addClass('active');
  let user_id = parseInt(td.dataset.user);
  let friend_id = parseInt(td.dataset.friend);
  let ids = [user_id, friend_id];
  let url = '/users/' + user_id + '/messages/' + friend_id;
  $.get(url, function (message) {
    let $div = $('<div/>');
    for (let i = 0; i < message.length; i++) {
      let divs_messages = document.getElementsByClassName("messagedivs");
      let html = '<div class="row popup message"><p><strong>' + message[i].user.username + '</strong>: ' + message[i].content + '</p>' +
        '<p class="msgtime" style="font-size: 10px">' + message[i].posted_at + '</p></div>';
      $div.append(html);
      $('div.messagedivs').html($div);
    }
  })
  $('#message_friend_id').val(friend_id);
}