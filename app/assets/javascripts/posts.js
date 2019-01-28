function Post(id, content, userid) {
  this.id = id;
  this.content = content;
  this.userid = userid;
}

Post.prototype.shortenContent = function () {
  if (this.content.length > 200) {
    return `${this.substring(0, 200)}...`;
  }
  else {
    return this.content;
  }
}

$(document).on('turbolinks:load', function () {
  $('form.newpost').submit(function (event) {
    event.preventDefault();
    alert("jo jo");
    debugger;
    Swal.fire({
      type: 'success',
      title: "Your post has been updated",
      showConfirmButton: false,
      timer: 1200
    })
  });
});