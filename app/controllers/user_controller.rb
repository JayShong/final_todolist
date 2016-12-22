class UserController < ApplicationController

	def index
		@user = User.new

	end

	def new

	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Your account has been created."
			session[:user_id] = @user.id
			redirect_to list_index_path
		else
			error_message = @user.errors.messages
			flash[:alert] = "#{error_message[:email].join}"
			redirect_to new_user_path
		end
	end

	def sign_in
		@user = User.new
		render "user/signin"
	end


	def logged_in
		@user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
		if @user
			flash[:success] = "You have logged in."
			session[:user_id] = @user.id
			redirect_to list_index_path
		else
			flash[:alert] = "Invalid email/password."
			redirect_to user_sign_in_path
		end
	end

	def profile
		@user = User.find(session[:user_id])
	end

	def update
		byebug
		@user = User.find(session[:user_id])
		@user.update(avatar: params[:user][:avatar])
		redirect_to profile_path
	end

	private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
