class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :get_token, only: [:create]

  # GET /projects.json
  def index
    @projects = Project.all
    render json: @projects, :only => [:id, :name, :description], :include => [{:memberships => {:only => [:id, :project_id, :user_id, :admin, :invitation, :email], :include => {:user => {:only => [:id, :email, :name, :admin]}}}}]
  end

  # GET /projects/1.json
  def show
    @project = Project.find params[:id]
    render json: @project, :only => [:id, :name, :description], :include => [{:memberships => {:only => [:id, :project_id, :user_id, :admin, :invitation, :email], :include => {:user => {:only => [:name]}}}}, {:groups => {:only => [:id, :name, :project_id], :include => {:tasks => {:only => [:id, :name, :status, :due_date, :priority, :owner]}}}}]
  end

  # POST /projects.json
  def create
    # Project is created in the Control panel which is unique to each user
    # Creating a project automatically creates an association with the user through a membership
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
      render json: @project, :only => [:id, :name, :description], :include => [{:memberships => {:only => [:id, :project_id, :user_id, :admin, :invitation, :email]}}]
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1.json
  def update
    if @project.update(project_params)
      render json: @project, :only => [:id, :name, :description], :include => [{:memberships => {:only => [:id, :project_id, :user_id, :admin, :invitation, :email], :include => {:user => {:only => [:name]}}}}, {:groups => {:only => [:id, :name, :project_id], :include => {:tasks => {:only => [:id, :name, :status, :due_date, :priority, :owner]}}}}]
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1.json
  def destroy
    @project.destroy
    head :no_content
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
