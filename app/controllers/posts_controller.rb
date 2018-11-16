class PostsController < ApplicationController
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 4)
    @user = User.find(session[:current_user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(session[:current_user_id])
    @post = @user.posts.build
  end

  def create
    @post = Post.new(post_params)
    redirect_to '/', message: "Action denied" if @post.user_id != session[:current_user_id]
    if @post && @post.save
      flash[:message] = "Created new post"
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def edit
    find_post
    session[:post_id] = @post.id
  end

  def update
    find_post
    redirect_to '/', alert: "Action denied" if @post.nil?
    if @post.id == session[:post_id] && @post.update(content: params[:post][:content])
      flash[:message] = "Post updated"
      redirect_to '/'
    else
      flash[:message] = "Action denied"
      render :edit
    end
  end

  def destroy
    find_post
    @post.destroy
    flash[:message] = "Post deleted"
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
