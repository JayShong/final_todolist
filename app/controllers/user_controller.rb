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

	def create_from_omniauth
        auth_hash = request.env["omniauth.auth"]

        authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
        if authentication.user
          @user = authentication.user 
          authentication.update_token(auth_hash)
        else
          @user = User.create_with_auth_and_hash(authentication,auth_hash)
        end
		flash[:success] = "Your account has been created."
		session[:user_id] = @user.id
		redirect_to list_index_path
     end

     def logout
		reset_session
		redirect_to user_index_path
     end

	private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
