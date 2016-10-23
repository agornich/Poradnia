class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	private
	
helper_method :current_user
  
def not_authenticated
  redirect_to login_path, alert: "Proszę przejdź do logowania."
end
	
  protect_from_forgery with: :exception
  before_action :require_login
end
