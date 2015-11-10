class SessionsController < ApplicationController
	def new
	end
	
	def create
		user = User.find_by_email(params[:email])
		# Nested 'if' statements used for invalid login handling 
		if verify_recaptcha(model: @session, message: "Invalid CAPTCHA" )
			if user && user.authenticate(params[:password])
				session[:user_id] = user.id
				redirect_to '/'
			else 
				redirect_to login_path, notice: "Invalid login/password"
			end
		else
			redirect_to login_path, notice: "Invalid CAPTCHA"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path, "data-no-turbolink" => true, class: "btn btn-primary btn-med"
	end
end
