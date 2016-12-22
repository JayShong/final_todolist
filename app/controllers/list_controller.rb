class ListController < ApplicationController

	def index
		if User.find(session[:user_id]).role == "Admin"
			@admin = 1
			@lists = List.all
		end
		if List.find_by(user_id: session[:user_id]).blank?
			@empty = 1
		else
			@list = List.find_by(user_id: session[:user_id])
			@tasks = @list.tasks
		end
	end

	def create
		@list = List.create(user_id: session[:user_id], title: params[:list][:title])
		flash[:success] = "You have created #{@list.title}."
		redirect_to list_index_path
	end

	def destroy
		List.destroy(params[:list_id])
		redirect_to list_index_path
	end

	private

 	def list_params
    params.require(:list).permit(:title)
  	end
end
