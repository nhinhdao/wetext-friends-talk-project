class SessionsController < ApplicationController
  def welcome
    if !logged_in?
      redirect_to '/login'
    else
      @user = User.find(session[:current_user_id])
      @messages = Message.inbox(@user)
      @feeds = Post.new_feeds(@user).take(3)
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
        flash[:login_success] = "Welcome back, #{@user.username}"
        render :welcome
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
      flash[:login_success] = "Thank you for checking in, #{@user.username}"
      render :welcome
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
