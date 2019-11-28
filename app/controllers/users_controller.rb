class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  # before_action :authenticate_user, only: [:show]

  # GET /users.json
  def index
    @users = User.all
    render json: @users, :except => [:created_at, :updated_at, :password_digest], :include => [{:memberships => {:except => [:created_at, :updated_at]}}]
  end

  # GET /users/1.json
  def show
    @user = User.find params[:id]
    render json: @user, :except => [:created_at, :updated_at, :password_digest], :include => [{:memberships => {:except => [:created_at, :updated_at], :include => {:project => {:except => [:created_at, :updated_at]}}}}]
  end

  # NOTE: registration controller taking care of user creation
  # def create
  # end

  # Not implementing update of user
  def update
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :memberships => [])
  end
end
