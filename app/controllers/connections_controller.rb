class ConnectionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(id: params[:connection][:friend_id])
    Connection.create(user_id: session[:current_user_id], friend_id: params[:connection][:friend_id])
    Connection.create(user_id: params[:connection][:friend_id], friend_id: session[:current_user_id])
    redirect_to request.referer
  end

  def destroy
    @connection1 = Connection.find_by(id: params[:id])
    @connection2 = Connection.find_by(@connection1.get_ids)
    Connection.destroy([@connection1.id, @connection2.id])
    redirect_to request.referer
  end
end
