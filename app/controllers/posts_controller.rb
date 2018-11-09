class PostsController < ApplicationController
  def index
    if params[:user_id]
      @posts = User.find(params[:user_id]).posts
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
