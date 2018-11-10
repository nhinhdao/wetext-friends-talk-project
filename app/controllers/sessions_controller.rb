class SessionsController < ApplicationController
  def welcome
    if !logged_in?
      redirect_to 'login'
    else
      render :welcome
    end
  end

  def new
    @user = User.new
  end

  def create
    if params[:email].present? && params[:password].present? #user logged in through form provided in the home page
      user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        user.image = Faker::Avatar.image
        session[:current_user_id] = @user.id
        redirect_to '/'
      else
        flash.now[:notice] = "Could not find that person, sorry!"
        render :new
      end
    elsif request.env['omniauth.auth'].present? #user logged in through facebook
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.username = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end
      session[:current_user_id] = @user.id
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
