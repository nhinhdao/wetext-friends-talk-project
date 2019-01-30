class PostsController < ApplicationController
  # TODO: Ask about authentication for ruby
  skip_before_action :verify_authenticity_token

  def index
    @posts = Post.all
    @user = User.find(session[:current_user_id])
    # render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def new
    @user = User.find(session[:current_user_id])
    @post = @user.posts.build
  end

  def create
    @post = Post.new(post_params)
    if @post && @post.save
      render json: @post, status: 201
    else
      flash[:warning] = "Uh oh! Your post is blank!"
      redirect_to request.referer
    end
  end

  def edit
    find_post
    session[:post_id] = @post.id
  end

  def update
    find_post
    # redirect_to '/', alert: "Action denied" if @post.nil?
    if @post && @post.update(content: params[:content])
      render json: @post
    # binding.pry
    else
      flash[:message] = "Action denied"
      render :edit
    end
  end

  def destroy
    find_post
    @post.destroy
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :content)
  end

  def find_post
    @user = User.find_by(id: session[:current_user_id])
    @post = @user.posts.find_by(id: params[:id])
  end
end
