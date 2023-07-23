class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task,  only: [:show, :edit, :update, :destroy]
 

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

def start
  @task = Task.find(params[:id])
  # @task.status = :in_progress
  @task.timer.start
  @task.save
  puts "Task started successfully"
  redirect_to projects_path
  end

def stop
  @task = Task.find(params[:id])
  # @task.status = :pending
  @task.timer.stop
  @task.save
  redirect_to projects_path
  end

  def create
    @task = Task.new(task_params)
    @task.elapsed = 0
    puts "Task created successfully and elapsed time is #{@task.elapsed}"

    if @task.save
      redirect_to projects_path, notice: 'Task was successfully created.'
    else
      render 'new'
    end
  end
  
  def update
    @task = Task.find(params[:id])
    elapsed_time = params[:task][:elapsed].to_i
  
    if elapsed_time.positive?
      # Update the elapsed time in seconds
      @task.elapsed = elapsed_time
    end
  
    if @task.update(task_params)
      redirect_to projects_path, notice: 'Task was successfully updated.'
    else
      render 'edit'
    end
  end
  
  
  # def update
  #   task = Task.find(params[:id])
  #   puts "Updating task #{task.id} with elapsed time #{params[:task][:elapsed]}"
  #   if task.update(task_params)
  #     render json: task
  #   else
  #     render json: task.errors, status: :unprocessable_entity
  #   end
  # end

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
    params.require(:task).permit(:name, :body, :project_id, :start_time, :end_time, :elapsed)
  end

end