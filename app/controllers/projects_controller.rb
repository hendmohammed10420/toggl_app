class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.includes(:user).order(id: :desc).all
  end

  def show
    @task = Task.new
  end

  def new
    @project = Project.new

  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      redirect_to project_path(@project), notice: 'Project successfully created!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project), notice: 'Project successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project successfully deleted!'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end