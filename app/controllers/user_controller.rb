class UserController < ApplicationController

	def index
		@user = User.new

	end

	def new

	end

	def create
		user = User.new(params[user])
		if user.save
			flash[:notice] = "Your account has been created."
			render "list/index"
		else
			flash[:alert] = "Your account cannot be created."
			redirect_to user_sign_in_path
		end
	end

	def sign_in
	end


	def logged_in
	end

end
