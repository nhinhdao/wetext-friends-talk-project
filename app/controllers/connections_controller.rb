class ConnectionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    @connection = Connection.create(connection_params)
    Connection.create(@connection.get_ids)
    render json: @connection
  end

  def show
    @connection = Connection.find(params[:id])
    render json: @connection
  end

  def destroy
    @connection1 = Connection.find_by(id: params[:id])
    @connection2 = Connection.find_by(@connection1.get_ids)
    Connection.destroy([@connection1.id, @connection2.id])
    redirect_to '/'
  end

  private

  def connection_params
    params.require(:connection).permit(:user_id, :friend_id)
  end
end
