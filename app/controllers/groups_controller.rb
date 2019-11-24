class GroupsController < ApplicationController
  before_action :set_group, :only => [:show, :edit]
  beforeaction :authenicate_user

  # GET /groups.json
  def index
    # Note: this is a redirect to this action from the route /projects/:project_id/groups.json
    # can change @groups depending on whether the user is admin or not
    @groups = Group.where(:project_id => params[:project_id])
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

    respond_to do |format|
      if @group.save
        format.json { render :show, status: :created, location: @group }
      else
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1.json
  def update
    @group = Group.where(:project_id => params[:project_id])
    respond_to do |format|
      if @group.update(group_params)
        format.json { render :show, status: :ok, location: @group }
      else
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1.json
  def destroy
    # Note this action is directed from /projects/:project_id/groups/:group_id
    @group = Group.where(:group_id => params[:group_id])
    @group.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :project_id)
  end
end
