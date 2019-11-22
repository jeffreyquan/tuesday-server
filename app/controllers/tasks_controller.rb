class TasksController < ApplicationController


  # TODO: limit tasks to only those belonging to 
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
