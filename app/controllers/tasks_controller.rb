class TasksController < ApplicationController
  before_action :set_task, :only => [:show, :edit]
  # before_action :check_for_login, :only =>
  # before_action :check_for_admin, :only => [:index]

  # GET /tasks.json
  def index
    # Note: this is an action directed from /groups/:group_id/tasks.json
    @tasks = Task.where[:group_id => params[:group_id]]
    render json: @tasks, :only => [:id, :name, :status, :due_date, :priority, :owner, :group_id], :include => [{:group => {:only => [:id, :name], :include => [{:project => {:only => [:id, :name, :description]}}]}}]
  end

  # GET /tasks/1.json
  def show
    # Note: this is a redirect from /groups/:group_id/tasks/:task_id
    @task = Task.find params[:id]
    render json: @task, :only => [:id, :name, :status, :due_date, :priority, :owner, :group_id], :include => [{:group => {:only => [:id, :name], :include => [{:project => {:only => [:id, :name, :description]}}]}}]
  end

  # GET /tasks/new
  def new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks.json
  def create
    # Note: this is a redirect from /groups/:group_id/tasks.json
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.json { render :show, status: :created, location: @task }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1.json
  def update
    # Note: this is a redirect from /groups/:group_id/tasks/:task_id
    @task = Task.where(:group_id => params[:group_id], :id => params[:task_id])
    respond_to do |format|
      if @task.update(task_params)
        format.json { render :show, status: :ok, location: @task}
      else
        format.json { render :json, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1.json
  def destroy
    # Note: this is a redirect from /projects/:project_id/tasks/:task_id
    @task = Task.where(:group_id => params[:group_id], :id => params[:task_id])
    @task.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :status, :due_date, :priorty, :owner, :group_id)
  end
end
