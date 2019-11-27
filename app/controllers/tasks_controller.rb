class TasksController < ApplicationController
  before_action :set_task, :only => [:show, :edit, :update, :destroy]

  # GET /tasks.json
  def index
    # Note: this is also a direct to this action from /groups/:group_id/tasks.json
    if params[:group_id].present?
      @tasks = Task.where(:group_id => params[:group_id])
    else
      # /tasks.json
      @tasks = Task.all
    end

    render json: @tasks, :except => [:created_at, :updated_at], :include => [{:group => {:only => [:id, :name], :include => [{:project => {:except => [:created_at, :updated_at]}}]}}]
  end

  # GET /tasks/1.json
  def show
    # Note: also directed from /groups/:group_id/tasks/:id
    if params[:group_id].present?
      @task = Task.where(:group_id => params[:group_id], :id => params[:id])
    else
      @task = Task.find params[:id]
    end

    render json: @task, :except => [:created_at, :updated_at], :include => [{:group => {:except => [:created_at, :updated_at], :include => [{:project => {:except => [:created_at, :updated_at]}}]}}]
  end

  # POST /tasks.json
  def create
    # Note: also directed from /groups/:group_id/tasks.json
    @task = Task.new(task_params)
    if @task.save
      render json: @task, :except => [:created_at, :updated_at], :include => [{:group => {:except => [:created_at, :updated_at], :include => [{:project => {:except => [:created_at, :updated_at]}}]}}]
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1.json
  def update
    # Note: also directed from /groups/:group_id/tasks/:id
    if @task.update(task_params)
      render json: @task, :except => [:created_at, :updated_at], :include => [{:group => {:except => [:created_at, :updated_at], :include => [{:project => {:except => [:created_at, :updated_at]}}]}}]
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1.json
  def destroy
    # Note: also directed from /projects/:project_id/tasks/:id
    @task.destroy
    head :no_content
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :status, :due_date, :priority, :owner, :group_id)
  end
end
