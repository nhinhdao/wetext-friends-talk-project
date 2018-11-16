class MessagesController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @messages = @user.messages.paginate(page: params[:page], per_page: 3)
      @inbox = Message.inbox(@user).paginate(page: params[:page], per_page: 3)
    else
      @messages = Message.all
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @message = @user.messages.build
  end

  def create
    @message = Message.new(message_params)
    if @message && @message.save
      flash[:message] = "Message was sent to #{@message.friend.username}"
      redirect_to user_messages_path(@message.user)
    else
      redirect_to '/'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @message = @user.messages.find(params[:id])
  end

  def update
    byebug
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :friend_id, :content)
  end
end
