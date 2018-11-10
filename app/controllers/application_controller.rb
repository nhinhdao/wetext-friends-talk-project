class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:current_user_id]
      user = User.find_by(id: session[:current_user_id])
    end
  end

  def logged_in?
    !!session[:current_user_id]
  end

end
