class MembershipsController < ApplicationController



  def index
    if @current_user.present? && @current_user.admin === true
      @memberships = Membership.all
    else
      @memberships = Membership.where(:user_id => @current_user.id)
    end

    render json: @memberships
  end
end
