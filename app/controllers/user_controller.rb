class UserController < ApplicationController

	def index
		@user = User.new

	end

	def new

	end

	def create
		user = User.new(user_params)
		if user.save
			flash[:success] = "Your account has been created."
			render "list/index"
		else
			byebug
			error_message = user.errors.messages
			flash[:alert] = "#{error_message[:email].join}"
			redirect_to new_user_path
		end
	end

	def sign_in
	end


	def logged_in
	end

	private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
