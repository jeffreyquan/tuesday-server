class GroupsController < ApplicationController
  before_action :set_group, :only => [:show, :edit, :update, :destroy]

  # GET /groups.json
  def index
    # Note: direct to this action from the route /projects/:project_id/groups.json
    if params[:project_id].present?
      @groups = Group.where(:project_id => params[:project_id])
    else
      @groups = Group.all
    end

    render json: @groups, :only => [:id, :name, :project_id], :include => [{:project => {:only => [:id, :name, :description]}}, {:tasks => {:only => [:id, :name, :status, :due_date, :priority, :owner, :group_id]}}]
  end

  # GET /groups/1.json
  def show
    @group = Group.find params[:id]
    render json: @group, :only => [:id, :name, :project_id], :include => [{:project => {:only => [:id, :name, :description]}}, {:tasks => {:only => [:id, :name, :status, :due_date, :priority, :owner, :group_id]}}]
  end

  # POST /groups.json
  def create
    @group = Group.new(group_params)
    if @group.save
      render json: @group, :only => [:id, :name, :project_id], :include => [{:project => {:only => [:id, :name, :description]}}]
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1.json
  def update
    if @group.update(group_params)
      render json: @group, :only => [:id, :name, :project_id], :include => [{:project => {:only => [:id, :name, :description]}}]
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1.json
  def destroy
    # Note: also directed from /projects/:project_id/groups/:id
    @group.destroy
    head :no_content
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :project_id, :tasks => [])
  end
end
