class MessagesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @messages = Message.allmsgs(@user)
    @uniq_users = Message.uniq_users(@messages).delete_if {|user| user == @user}
    ids = [@user.id, @uniq_users.first.id]
    @pair_messages = Message.pair_messages(ids)
  end
  
  def all_messages
    if params[:id] && params[:fid]
      ids = [params[:id].to_i, params[:fid].to_i]
      @messages = Message.pair_messages(ids)
      render json: @messages
    else
      render 'messages/notfound'
    end
  end
  
  def new
    @friend = User.find(params[:user_id])
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    if @message && @message.save
      render json: @message, status: 201
    else
      flash[:warning] = "Uh oh! Message's content can't be blank!"
      redirect_to request.referer
    end
  end
  
  def edit
    find_message
  end
  
  def update
    @message = Message.find(params[:id])
    @message.content = params[:message][:content]
    if @message.user.id == session[:current_user_id] && @message.save
      flash[:message] = "Message updated"
      redirect_to message_path(@message)
    else
      flash[:warning] = "Something was wrong. Please try again"
      redirect_to request.referer
    end
  end
  
  def show
    @message = Message.find(params[:id])
  end
  
  def destroy
    find_message
    if @message
      @message.destroy
      flash[:message] = "Message deleted"
    else
      flash[:warning] = "Action denied!"
    end
    redirect_to user_messages_path(@user)
  end
  
  private
  
  def message_params
    params.require(:message).permit(:user_id, :friend_id, :content)
  end
  
  def find_message
    @user = User.find_by(id: session[:current_user_id])
    @message = @user.messages.find(params[:id])
  end
end
