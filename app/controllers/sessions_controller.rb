class SessionsController < ApplicationController
  def welcome
    if !logged_in?
      redirect_to '/login'
    else
      @user = User.find(session[:current_user_id])
      @feeds = Post.new_feeds.paginate(page: params[:page], per_page: 3)
      render :welcome
    end
  end

  def new
    @user = User.new
  end

  def create
    if params[:username].present? && params[:password].present? #user logged in through form provided in the home page
      @user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
        session[:current_user_id] = @user.id
        flash[:message] = "Welcome back, #{@user.username}"
        redirect_to '/'
      else
        flash[:notice] = "Hmm, We can't find you. Sorry, please try again!"
        render :new
      end
    elsif request.env['omniauth.auth'].present? #user logged in through facebook
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.username = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end
      session[:current_user_id] = @user.id
      flash[:message] = "Thank you for checking in, #{@user.username}"
      redirect_to '/'
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
