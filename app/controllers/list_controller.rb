class ListController < ApplicationController

	def index
		if List.find_by(user_id: session[:user_id]).blank?
			@empty = 1
		else
			@list = List.find_by(user_id: session[:user_id])
		end
	end

	def create
		@list = List.create(user_id: session[:user_id], title: params[:list][:title])
		flash[:success] = "You have created #{@list.title}."
		redirect_to list_index_path
	end

	private

 	def list_params
    params.require(:list).permit(:title)
  	end
end
