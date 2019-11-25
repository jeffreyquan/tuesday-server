class GroupsController < ApplicationController
  before_action :set_group, :only => [:show, :edit, :update, :destroy]
  # before_action :authenticate_user

  # GET /groups.json
  def index
    # Note: this is a redirect to this action from the route /projects/:project_id/groups.json
    # can change @groups depending on whether the user is admin or not
    if params[:project_id].present?
      @groups = Group.where(:project_id => params[:project_id])
    else
      @groups = Group.all
    end

    render json: @groups, :only => [:id, :name, :project_id], :include => [{:project => {:only => [:id, :name, :description]}}], :include => [{:tasks => {:only => [:id, :name, :status, :due_date, :priority, :owner, :group_id]}}]
  end

  # GET /groups/1.json
  def show
    @group = Group.find params[:id]
    render json: @group, :only => [:id, :name, :project_id], :include => [{:project => {:only => [:id, :name, :description]}}], :include => [{:tasks => {:only => [:id, :name, :status, :due_date, :priority, :owner, :group_id]}}]
  end

  # GET /groups/new
  def new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups.json
  def create
    @group = Group.new(group_params)
    if @group.save
      render json: @group
    else
      render json: @group.errors
    end
  end

  # PATCH/PUT /groups/1.json
  def update
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors
    end
  end

  # DELETE /groups/1.json
  def destroy
    # Note this action is directed from /projects/:project_id/groups/:id
    @group.destroy

  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :project_id, :tasks => [])
  end
end
