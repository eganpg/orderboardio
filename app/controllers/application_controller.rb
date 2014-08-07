class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_mainorderboard
  def current_user
  	@current_user ||= Login.find(session[:login_id]) if session[:login_id]
  end
  # def current_mainorderboard
  # 	@current_mainorderboard ||= Mainorderboard.find(session[:login_id]) if session[:login_id]
  # end
end
