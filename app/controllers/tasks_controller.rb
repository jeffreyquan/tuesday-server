class TasksController < ApplicationController
  before_action :set_task, :only => [:show, :edit, :update, :destroy]
  # before_action :check_for_login, :only =>
  # before_action :check_for_admin, :only => [:index]

  # GET /tasks.json
  def index
    @tasks = Task.all
    render json: @tasks, :only => [:name, :status, :due_date, :priority, :owner, :group], :include => [{:project => {:only => [:id, :name, :description]}}]
  end

  # GET /tasks/1.json
  def show
    @task = Task.find params[:id]
    render json: @task, :only => [:name, :status, :due_date, :priority, :owner, :group], :include => [{:project => {:only => [:id, :name, :description]}}]
  end

  # GET /tasks/new
  def new

  end

  # GET /tasks/1/edit
  def edit

  end

  def create
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
    params.require(:task).permit(:name, :status, :due_date, :priorty, :owner, :project_id)
  end

end
