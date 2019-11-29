class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :get_token, only: [:create]

  # GET /projects.json
  def index
    @projects = Project.all
    render json: @projects, :except => [:created_at, :updated_at], :include => [{:memberships => {:except => [:created_at, :updated_at], :include => {:user => {:except => [:created_at, :updated_at, :password_digest]}}}}]
  end

  # GET /projects/1.json
  def show
    @project = Project.find params[:id]
    render json: @project, :except => [:created_at, :updated_at], :include => [{:memberships => {:except => [:created_at, :updated_at], :include => {:user => {:only => [:name]}}}}, {:groups => {:except => [:created_at, :updated_at], :include => {:tasks => {:except => [:created_at, :updated_at]}}}}]
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
      membership.save
      @project.memberships << membership

      g1 = Group.new
      g1.name = "Group Title"
      g1.project_id = @project.id
      g1.save

      t1 = Task.new
      t1.name = "Item 1"
      t1.owner = user.name
      t1.status = "Working On It"
      t1.priority = "Medium"
      t1.due_date = "2019-11-30"
      t1.save

      t2 = Task.new
      t2.name = "Item 2"
      t2.status = "Done"
      t2.due_date = "2019-11-30"
      t2.save

      t3 = Task.new
      t3.name = "Item 3"
      t3.due_date = "2019-11-30"
      t3.save

      g1.tasks << t1 << t2 << t3

      g2 = Group.new
      g2.name = "Group Title"
      g2.project_id = @project.id
      g2.save

      t4 = Task.new
      t4.name = "Item 4"
      t4.due_date = "2019-11-30"
      t4.save

      t5 = Task.new
      t5.name = "Item 5"
      t5.due_date = "2019-11-30"
      t5.save

      g2.tasks << t4 << t5

      render json: @project, :except => [:created_at, :updated_at], :include => [{:memberships => {:except => [:created_at, :updated_at], :include => [{:project => {:except => [:created_at, :updated_at]}}]}}]
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1.json
  def update
    if @project.update(project_params)
      render json: @project, :except => [:created_at, :updated_at], :include => [{:memberships => {:except => [:created_at, :updated_at], :include => {:user => {:only => [:name]}}}}, {:groups => {:except => [:created_at, :updated_at], :include => {:tasks => {except => [:created_at, :updated_at]}}}}]
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
