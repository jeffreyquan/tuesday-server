class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  # NOTE: remove restriction temporarily for testing
  # before_action :check_for_login, :only => [:show, :create, :update, :destroy]

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

  # CUSTOM ACTIONS

  # GET /projects/:project_id/groups.json
  def groups_index
    @groups = Group.where(:project_id => params[:project_id])
    render json: @groups, :only => [:id, :name, :project_id], :include => [{:project => {:only => [:id, :name, :description]}}], :include => [{:tasks => {:only => [:id, :name, :status, :due_date, :priority, :owner, :group_id]}}]
  end

  # POST /projects/:project_id/groups.json
  def group_create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        format.json { render :show, status: :created, location: @group }
      else
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /groups/:group_id/tasks.json
  def group_tasks_index
    @tasks = Task.where(:group_id => params[:group_id])
    render json: @tasks, :only => [:id, :name, :status, :due_date, :priority, :owner, :group_id], :include => [{:group => {:only => [:id, :name],:include => [{:project => {:only => [:id, :name, :description]}}]}}]
  end

  # GET /groups/:group_id/tasks/:task_id
  def group_task_show
    @task = Task.where(:group_id => params[:group_id], :id => params[:task_id])
    render json: @task, :only => [:id, :name, :status, :due_date, :priority, :owner, :group_id], :include => [{:group => {:only => [:id, :name],:include => [{:project => {:only => [:id, :name, :description]}}]}}]
  end

  # POST /groups/:group_id/tasks.json
  def group_task_create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.json { render :show, status: :created, location: @task }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/:group_id/tasks/:task_id
  def group_task_update
    @task = Task.where(:group_id => params[:group_id], :id => params[:task_id])
    respond_to do |format|
      if @task.update(task_params)
        format.json { render :show, status: :ok, location: @task }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/:project_id/tasks/:task_id
  def group_task_destroy
    @task = Task.where(:group_id => params[:group_id], :id => params[:task_id])
    @task.destroy
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

  def group_params
    params.require(:group).permit(:name, :project_id)
  end

  def task_params
    params.require(:task).permit(:name, :status, :due_date, :priorty, :owner, :group_id)
  end
end
