class UsersController < ApplicationController
  def index
    @user = User.find_by(id: session[:current_user_id])
    @users = User.other_users(@user).paginate(page: params[:page], per_page: 3)
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
        flash[:message] = "Thank you for signing up"
        render 'sessions/welcome'
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @allmessages = Message.inbox(@user).count + @user.messages.count
    @connection = Connection.find_by(user_id: session[:current_user_id], friend_id: @user.id)
  respond_to do |f|
    f.html { render :show }
    f.json { render json: @user }
  end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      flash[:message] = "Successfully updated."
      redirect_to '/'
    else
      render :edit
    end
  end

  def destroy
    byebug
  end

  def friends
    @user = User.find(params[:id])
    @friends = @user.connections.paginate(page: params[:page], per_page: 3)
  end

  private

  def users_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
