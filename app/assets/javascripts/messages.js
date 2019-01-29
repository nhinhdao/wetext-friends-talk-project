$(document).on('turbolinks:load', function () {
  // load each sender messages without refreshing page
  $('td.choice.text-center').on('click', openMessages)

  //set open first message by default
  $('#defaultOpen').click();

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
  });

  //Handle new post on home page
  $('form#new_post').submit(function (event) {
    event.preventDefault();
    event.stopPropagation();
    let values = $(this).serialize();
    var template = Handlebars.compile(document.getElementById("post-template").innerHTML)
    var posting = $.post('/posts', values);
    posting.done(function (data) {
      let post = new Post(data);
      let result = template(post);
      $(".homepage_feeds").prepend(result);
      Swal.fire({
        type: 'success',
        title: "Your post has been uploaded",
        showConfirmButton: false,
        timer: 1200
      })
    })
  });

  //Handle post delete request 
  $('a.delete_post').click(function (event) {
    event.preventDefault();
    event.stopPropagation();
    debugger;
    let path = this;
    Swal.fire({
      title: 'Are you sure?',
      text: "This can't be reverted!",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      debugger;
      if (result.value) {
        $.ajax({
          url: path.href,
          type: "DELETE",
          dataType: 'json',
          success: function (data) {
            console.log(data);
            debugger;
           }
          })
          Swal.fire(
            'Deleted!',
            'Your post has been deleted.',
            'success'
          )
      }
      else {
        Swal.fire("Cancelled", "Your post is safe!", "error");
      }
    })
  });
})

function Message(message_hash) {
  this.id = message_hash["id"];
  this.content = message_hash["content"];
  this.userimg = message_hash["user"]["image"];
  this.username = message_hash["user"]["name"];
  this.posted_at = message_hash["posted_at"];
}

function openMessages() {
  // debugger;
  $(this).removeClass('active');
  $(this).addClass('active');
  let user_id = parseInt(this.dataset.user);
  let friend_id = parseInt(this.dataset.friend);
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

