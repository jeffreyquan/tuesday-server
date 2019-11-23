class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  # NOTE: remove restriction temporarily for testing
  # before_action :check_for_login, :only => [:show, :create, :update, :destroy]


  def index
    @projects = @current_user.projects
  end

  # GET /projects/1.json
  def show
    # TODO: only show project if it is associated with user
    @project = Project.find params[:id]
    render json: @project, :include => [:memberships, :tasks]
  end

  def new

  end

  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.json { render :show, status: :created, location: @project }
      else
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.json { render :show, status: :ok, location: @project }
      else
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
