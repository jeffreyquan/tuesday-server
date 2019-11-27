class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]
  
  # GET /memberships.json
  def index
    # Note: this action is also directed from /users/user_id/memberships
    if params[:user_id].present?
      @memberships = Membership.where(:user_id => params[:user_id])
    else
      @memberships = Membership.all
    end
    render json: @memberships, :only => [:id, :project_id, :user_id, :admin, :invitation, :email], :include => [{:user => {:only => [:id, :name, :email, :admin]}}, {:project => {:only => [:id, :name, :description]}}]
  end

  # GET /memberships/1.json
  def show
    @membership = Membership.find params[:id]
    render json: @membership, :only => [:id, :project_id, :user_id, :admin, :invitation, :email], :include => [{:user => {:only => [:id, :email, :name, :admin]}}, {:project => {:only => [:id, :name, :description]}}]
  end

  # POST /memberships.json
  def create
    admin = membership_params["admin"]
    puts admin
    invitation = membership_params["invitation"]
    puts invitation
    project_id = membership_params["project_id"]
    puts project_id
    email = membership_params["email"]
    puts email

    # Check if user is present in database.
    # Invites in the front end are only via email
    user = User.where(:email => email)
    if user.present?
      user_id = user[0].id
      puts user_id
    else
      render json: { message: 'Bad request'}, status: :unprocessable_entity
      return
    end

    ## A user can only have one membership with a project. This is validated in the model.
    # existing_record = Membership.where(:user_id => user_id, :project_id => project_id)
    #
    # if existing_record.present?
    #   render json: { message: 'Bad request'}, status: :unprocessable_entity
    #   return
    # end

    @membership = Membership.create :admin => admin, :invitation => invitation, :project_id => project_id, :email => email, :user_id => user_id

    if @membership.save
      render json: @membership, :only => [:id, :project_id, :user_id, :admin, :invitation, :email], :include => {:user => {:only => [:name]}}
    else
      render json: @membership.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /memberships/1.json
  def update
    if @membership.update(membership_params)
      render json: @membership, :only => [:id, :project_id, :user_id, :admin, :invitation, :email], :include => [{:user => {:only => [:name]}}]
    else
      render json: @membership.errors, status: :unprocessable_entity
    end
  end

  # DELETE /memberships/1.json
  def destroy
    # Note: this action is also directed from /users/:user_id/memberships/:id
    @membership.destroy
    head :no_content
  end

  private
  def set_membership
    @membership = Membership.find(params[:id])
  end

  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :admin, :invitation, :email)
  end
end
