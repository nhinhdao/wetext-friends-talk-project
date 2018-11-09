class MessagesController < ApplicationController
  def index
    if params[:user_id]
      @messages = User.find(params[:user_id]).messages
    else
      @messages = Message.all
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
