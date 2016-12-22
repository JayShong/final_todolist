class TaskController < ApplicationController

	def create
		Task.create(list_id: params[:list_id], description: params[:description] , status: 0)
		redirect_to list_index_path
	end

	def complete
		@task = Task.find(params[:task_id])
		if @task.status == false
			@task.update(status: true)
		else
			@task.update(status: false)
		end
		redirect_to list_index_path
	end
end
