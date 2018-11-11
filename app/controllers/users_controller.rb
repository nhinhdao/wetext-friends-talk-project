class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.new(users_params)
      if @user && @user.save
        @user.update(image: Gravatar.new("#{@user.email}").image_url + "?d=wavatar")
        session[:current_user_id] = @user.id
        flash[:signup_success] = "Thank you for signing up"
        render 'sessions/welcome'
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def show

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    flash[:update_success] = "Successfully updated."
    redirect_to '/'
  end

  def destroy
  end

  private

  def users_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
