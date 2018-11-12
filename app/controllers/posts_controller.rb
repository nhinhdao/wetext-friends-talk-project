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
    @post = Post.create(post_params)
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :pcontent)
  end
end
