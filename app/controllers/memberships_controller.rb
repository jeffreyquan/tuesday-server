class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]
  before_action :check_for_login, :only => [:create, :new, :edit, :update, :destroy]

  # GET /memberships.json
  def index
    if @current_user.present? && @current_user.admin === true
      @memberships = Membership.all
    else
      @memberships = Membership.where(:user_id => @current_user.id)
    end
    render json: @memberships
  end

  # GET /memberships/1.json
  def show

  end

  # GET /memberships/new
  def new

  end

  # GET /memberships/1/edit
  def edit

  end

  # POST /memberships.json
  def create
    @membership = Membership.new(membership_params)

    respond_to do |format|
      if @membership.save
        format.json { render :show, status: :created, location: @membership}
      else
        format.json { render json: @membership.errors status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.json { render :show, status: :ok, location: @membership}
      else
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
  end

  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    respond_to do |format|
      format.json { head :no_content}
    end
  end

  end

  private
  def set_membership
    @membership = Membership.find(params[:id])
  end

  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :admin, :invitation, :email)
  end
end
