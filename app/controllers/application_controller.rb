class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def authorize
		unless current_user		
			redirect_to login_path, notice: "You must be logged in to access this section"
			redirect_to '/login'
		end
	end

	def authorize_admin
		unless current_user && current_user.admin
			redirect_to login_path, notice: "You must be logged in as an admin to access this webpage" 
		end
	end
end
