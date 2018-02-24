class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def require_login
      redirect_to '/' unless session.include? :user_id
    end

    def require_admin
      redirect_to '/' unless User.find(session[:user_id]).admin == true
    end
end
