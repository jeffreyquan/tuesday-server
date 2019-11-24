class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  # NOTE: remove restriction temporarily for testing
  # before_action :check_for_login, :only => [:show, :create, :update, :destroy]
  before_action :authenticate_user

  # GET /projects.json
  def index
    @projects = Project.all
    render json: @projects, :only => [:id, :name, :description], :include => [{:memberships => {:only => [:id, :project_id, :user_id, :admin, :invitation, :email], :include => {:user => {:only => [:id, :email, :name, :admin]}}}}]
  end

  # GET /projects/1.json
  def show
    # TODO: only show project if it is associated with user
    @project = Project.find params[:id]
    render json: @project, :only => [:id, :name, :description], :include => [{:memberships => {:only => [:id, :project_id, :user_id, :admin, :invitation, :email]}}, {:tasks => {:only => [:name, :status, :due_date, :priority, :owner, :group]}}]
  end

  # GET /projects/new
  def new
  end

  # GET /projects/1/edit
  def edit
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
