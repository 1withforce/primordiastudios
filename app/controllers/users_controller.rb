class UsersController < ApplicationController

	# Only allow admins to delete user accounts
	before_action :authorize_admin, only: [:destroy]

	def new
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
		user = User.new(user_params)
		user.admin=false
		if user.save
			session[:user_id]=user.id
			redirect_to '/'
		else
			redirect_to '/signup'
		end
	end

	def destroy
		user = User.find(params[:id])
		user_name = user.name
		user.destroy
		redirect_to users_path, notice: "User '"+user_name+"' deleted"
	end

private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
