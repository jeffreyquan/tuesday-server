class TasksController < ApplicationController
  before_action :check_for_login, :only =>
  before_action :check_for_admin, :only => [:index]

  def index
    @tasks = Task.all
  end

  def show
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
  def task_params
    params.require(:task).permit(:name, :status, :due_date, :priorty, :owner, :project_id)
  end

end
