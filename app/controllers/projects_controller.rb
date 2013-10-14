class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Portfolio was successfully created"
      redirect_to @project
    else
      #laters
    end
  end

  def show
    @project = Project.find(params[:id])
  end
end
