class TasksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.build
  end

  def edit
    @list = List.find(params[:list_id])
    @task = @list.tasks.build
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.build(task_params)
    @task.user_id = current_user.id

    if @task.save
      redirect_to @list, notice: 'Task successfully created'
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to @list, notice: 'Task successfully deleted.'
  end

  protected

  def task_params
    params.require(:task).permit(:description)
  end

end
