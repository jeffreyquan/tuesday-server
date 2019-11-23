class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  # before_action :check_for_login, :only => [:show]
  # before_action :check_for_admin, :only => [:index]

  # GET /user.json
  def index
    @users = User.all
    render json: @users, :except => [:password_digest, :created_at, :updated_at]
  end

  # GET /user/1.json
  def show
    @user = User.find params[:id]
    render json: @user, :only=> [:id, :email, :name, :admin], :include => [{:memberships => {:only => [:id, :project_id, :user_id, :admin, :invitation, :email], :include => {:project => {:only => [:id, :name, :description]}}}}]
  end

  # NOTE: registration controller taking care of user creation
  # def create
  # end


  def update

  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password)
  end
end
