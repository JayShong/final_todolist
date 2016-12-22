class TaskController < ApplicationController

	def create
		Task.create(list_id: params[:list_id], description: params[:description] , status: 0)
		redirect_to list_index_path
	end
end
