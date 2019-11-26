class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  # NOTE: remove restriction temporarily for testing
  # before_action :check_for_login, :only => [:show, :create, :update, :destroy]
  before_action :get_token

  # GET /projects.json
  def index
    @projects = Project.all
    render json: @projects, :only => [:id, :name, :description], :include => [{:memberships => {:only => [:id, :project_id, :user_id, :admin, :invitation, :email], :include => {:user => {:only => [:id, :email, :name, :admin]}}}}]
  end

  # GET /projects/1.json
  def show
    # TODO: only show project if it is associated with user
    @project = Project.find params[:id]
    render json: @project, :only => [:id, :name, :description], :include => [{:memberships => {:only => [:id, :project_id, :user_id, :admin, :invitation, :email]}}], :include => [{:groups => {:only => [:id, :name, :project_id], :include => {:tasks => {:only => [:id, :name, :status, :due_date, :priority, :owner]}}}}]
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
    user_id = @token[0]["id"].to_i
    puts user_id
    user = User.where(:id => user_id)
    if @project.save
      membership = Membership.new
      membership.project_id = @project.id
      membership.user_id = user_id
      membership.admin = true
      membership.invitation = true
      membership.email = user[0].email
      @project.memberships << membership
      render json: @project, :only => [:id, :name, :description], :include => [{:memberships => {:only => [:id, :project_id, :user_id, :admin, :invitation, :email], :include => {:project => {:only => [:id, :name, :description]}}}}]
    else
      render json: @project.errors
    end
  end

  # PATCH/PUT /projects/1.json
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors
    end
  end

  # DELETE /projects/1.json
  def destroy

    @project.destroy

  end

  private
  def get_token
    @token = authenticate_user()
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :memberships => [], :groups => [])
  end
end
