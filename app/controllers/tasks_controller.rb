class TasksController < ApplicationController
  before_action :set_task, :only => [:show, :edit, :update, :destroy]
  # before_action :check_for_login, :only =>
  # before_action :check_for_admin, :only => [:index]

  def index
    @tasks = Task.all
    render json: @tasks, :only => [:name, :status, :due_date, :priority, :owner, :group], :include => [{:project => {:only => [:id, :name, :description]}}]
  end

  def show
    @task = Task.find params[:id]
    render json: @task, :only => [:name, :status, :due_date, :priority, :owner, :group], :include => [{:project => {:only => [:id, :name, :description]}}]
  end

  def new

  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :status, :due_date, :priorty, :owner, :project_id)
  end

end
