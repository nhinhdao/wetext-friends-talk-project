function Post(post_hash) {
  this.id = post_hash['id'];
  this.content = post_hash['content'];
  this.userid = post_hash['user']['id'];
  this.username = post_hash['user']['username'];
  this.userimg = post_hash['user']['image'];
  this.postedAt = post_hash['posted_at'];
}


Post.prototype.renderHTML = function (element) {
  let template = Handlebars.compile(document.getElementById(element).innerHTML)
  return template(this);
}