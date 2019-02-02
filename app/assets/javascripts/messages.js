function Message(message_hash) {
  this.id = message_hash["id"];
  this.content = message_hash["content"];
  this.userimg = message_hash["user"]["image"];
  this.posted_at = message_hash["posted_at"];
}

let data = {"id": "", "content": ""};

$(document).on('turbolinks:load', function () {
  // load each sender messages without refreshing page

  $('td.choice.text-center').on('click', openMessages)

  // prevent redirecting for CREATING A NEW MESSAGE on ALL MESSAGES PAGE
  $('form#new_message').submit(function (event) {
    //prevent form from submitting the default way
    event.preventDefault();
    event.stopPropagation();
    // Rescue preventDefault
    if ($('#message_content').val()) {
      var values = $(this).serialize();
      var posting = $.post('/messages', values);
      let template = Handlebars.compile(document.getElementById("new-message-template").innerHTML);
      posting.done(function (data) {
        // Handle response
        $('#message_content').val("");
        $('.message_error').html("");
        let message = new Message(data);
        let result = template(message)
        $('.trmessages').append(result);
      });
    }
    else{
      // warn user for trying to update an empty post
      $('.message_error').html("Sorry, you can't send an empty message").css("color", "red");
    }
  });

  // prevent redirecting for CREATING A NEW MESSAGE on NEW MESSAGE PAGE
  $('form#create_message').submit(function (event) {
    //prevent form from submitting the default way
    event.preventDefault();
    event.stopPropagation();
    // Rescue preventDefault
    if ($('.newmsg').val()) {
      var values = $(this).serialize();
      var posting = $.post('/messages', values);
      posting.done(function (data) {
        // Handle response
        $('.message_fail').html();
        let message = new Message(data);
        $('div.newmessage').html(message.content);
        $('div.posted').html("Sent: " + message.posted_at);
        $('h3.new.text-info').html("New Message");
      });
    }
    else{
      // warn user for trying to update an empty post
      $('.message_fail').html("Sorry, you can't send an empty message").css("color", "red");
    }
  });

  //Handle CREATING A NEW POST on home page
  $('form#new_post').submit(function (event) {
    event.preventDefault();
    event.stopPropagation();
    if ($('#post_content').val()) {
      let values = $(this).serialize();
      let template = Handlebars.compile(document.getElementById("post-template").innerHTML)
      let posting = $.post('/posts', values);
      posting.done(function (data) {
        $('#post_content').val("");
        $('.post_error').html("");
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
    }
    else {
      // warn user for trying to update an empty post
      $('.post_error').html("Sorry, It is an empty post!").css("color", "red");
    }
  });

  //Handle EDIT A NEW POST on home page
  $('a.edit_post_homepage').click(function (event) {
    event.preventDefault();
    event.stopPropagation();
    let id = this.dataset['id'];
    let content = $('.post-' + id).text();
    data = {"id": id, "content": content}
    let template = Handlebars.compile(document.getElementById("edit-post-template").innerHTML);
    let result = template(data)
    $('.post-'+id).html(result);
  })

  
  //Handle DELETING A POST request 
  $('a.delete_post').click(function (event) {
    event.preventDefault();
    event.stopPropagation();
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
      if (result.value) {
        $.ajax({
          url: path.href,
          type: "DELETE",
          dataType: 'json',
          success: function (data) {}
        })
        $(path).parents(".post_parent").remove();
        Swal.fire({
          type: 'success',
          title: "Your post has been deleted",
          showConfirmButton: false,
          timer: 1200
        })
      }
      else {
        Swal.fire("Cancelled", "Your post is safe!", "error", 1200);
      }
    })
  });


  //Handle UNFRIEND on Friends Index Page
  $('.unfriend').click(function (event) {
    event.preventDefault();
    event.stopPropagation();
    let path = this;
    let template = Handlebars.compile(document.getElementById("remove-friend-template").innerHTML);
    let data = {friendId: this.dataset["id"]};
    Swal.fire({
      title: 'Are you sure?',
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Unfriend'
    }).then((result) => {
      if (result.value) {
        $.ajax({
          url: path.href,
          type: "DELETE",
          dataType: 'json',
          success: function (data) {}
          })
          $(path).parents(".align-items-center").remove();
          let result = template(data);
          $('div.new_friend').html(result);
          Swal.fire({
            type: 'success',
            title: "Unfriended successfully",
            showConfirmButton: false,
            timer: 1200
          })
      }
      else {
        Swal.fire("Cancelled", "Your friendship is safe!", "error", 1200);
      }
    })
  })

  //Handle ADD FRIEND
  $('.addfriend').click(function (event) {
    event.preventDefault();
    event.stopPropagation();
    let path = this;
    let values = $(path).parent().serialize();
    let template =  Handlebars.compile(document.getElementById("new-friend-template").innerHTML);
    let posting = $.post('/connections', values);
    posting.done(function (data) {
      $(path).parents(".user_list").remove();
      let result = template(data);
      $('div.new_friend').html(result);
      Swal.fire({
        type: 'success',
        title: "Friend Added Successfully",
        showConfirmButton: false,
        timer: 1200
      })
    })
  });
})


function openMessages() {
  //set active class on clicked user
  $('td.choice.active').removeClass('active');
  $(this).addClass('active');
  let user_id = parseInt(this.dataset.user);
  let friend_id = parseInt(this.dataset.friend);
  let url = '/users/' + user_id + '/messages/' + friend_id;
  $.get(url, function (message) {
    let template = Handlebars.compile(document.getElementById("open-message-template").innerHTML);
    let result = template(message);
    $('div.messagedivs').html(result);
  })
  $('#message_friend_id').val(friend_id);
}

function editpost() {
  let content = $('.postcontent').val();
  let id = $('.postcontent').data().id;
  if (content != "") {
    $.ajax({
      url: "/posts/" + id,
      type: 'PATCH',
      data: {'content': content},
      success: function (data) {
        $('.post-' + id).html(data.content);
        Swal.fire({
          type: 'success',
          title: "Your post has been updated",
          showConfirmButton: false,
          timer: 1200
      })}
    })
  }
  else{
    // warn user for trying to update an empty post
    $('.postcontent').val("Sorry, You can't update an empty post!").css("color", "red");
  }
  }

//cancel EDIT MESSAGE
function canceledit() {
  $('.post-' + data['id']).html(data['content']);
}