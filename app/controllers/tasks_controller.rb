class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task_new = Task.new

  end

  def create
    @task_create = Task.new(task_params)
    @task_create.save
    redirect_to '/tasks'
  end

  def edit
    @task_edit = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # No need for app/views/tasks/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy
  @task = Task.find(params[:id])
  @task.destroy
  # No need for app/views/restaurants/destroy.html.erb
  redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
