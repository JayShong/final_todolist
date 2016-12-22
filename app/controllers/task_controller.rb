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

	def destroy
		@list = List.find(params[:list_id])
		@tasks = @list.tasks
		@tasks.each do |t|
			if t.status == true 
				t.destroy
			end
		end
		respond_to do |format|
			format.html { redirect_to list_index_path }
			format.js { render "list/index"}
		end

	end
end
