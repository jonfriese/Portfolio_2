class ProjectsController < ApplicationController
  before_filter :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @projects = policy_scope(Project)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    authorize @project
    respond_to do |format|
      if @project.save
        current_user.projects << @project
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @projects }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  def edit
    authorize @project
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @project
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

private
  def set_project
    @project = Project.find(params[:id])
  end

end
