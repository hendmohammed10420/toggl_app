class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task, only: [:update, :destroy]
 

  def show
    @task = Task.find(params[:id])
  end
  def edit
    @task = Task.find(params[:id])
  end
  
  def new
  @project = Project.find(params[:project_id])
  @task = @project.tasks.new
end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to projects_path, notice: 'Task was successfully created.'
    else
      render 'new'
    end
  end
  
  def update
    if @task.update(task_params)
      redirect_to projects_path, notice: 'Task was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to projects_path, notice: 'Task was successfully deleted.'
  end

  private

  def set_project
    @project = Project.find_by(id: params[:project_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:body, :name, :project_id)
  end

end