function Post(post_hash) {
  this.id = post_hash['id'];
  this.content = post_hash['content'];
  this.userid = post_hash['user']['id'];
  this.username = post_hash['user']['username'];
  this.userimg = post_hash['user']['image'];
  this.posted_at = post_hash['posted_at'];
}

Post.prototype.shortenContent = function () {
  if (this.content.length > 200) {
    return `${this.substring(0, 200)}...`;
  }
  else {
    return this.content;
  }
}
