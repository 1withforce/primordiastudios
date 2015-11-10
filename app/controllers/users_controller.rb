class UsersController < ApplicationController

	# Only allow admins to delete user accounts
	before_action :authorize_admin, only: [:destroy]

	def new
		@user=User.new
	end

	def index
		if current_user && current_user.admin
	 		@is_admin = true
		else 
			@is_admin = false 
		end
		@users=User.all
	end

	def create
		@user = User.new(user_params)
		@user.admin = false
		if verify_recaptcha(model: @user, message: "Invalid CAPTCHA" )
			session[:user_id]=@user.id
			@user.save
		else
			redirect_to signup_path, notice: "Invalid CAPTCHA"
		end
	end

	def destroy
		user = User.find(params[:id])
		user_name = user.name
		if current_user == user
			session.clear
		end 
		user.destroy
		redirect_to users_path, notice: "User '"+user_name+"' deleted"
	end

private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
