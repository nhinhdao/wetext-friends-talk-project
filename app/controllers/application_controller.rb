class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!session[:current_user_id]
  end

  def notfound
    render 'messages/notfound'
  end
end
