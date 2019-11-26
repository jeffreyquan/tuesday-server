class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include ::ActionController::Cookies
  before_action :fetch_user

  def bearer_token
    pattern = /^Bearer /
    header  = request.headers['Authorization']
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def authenticate_user
    puts bearer_token
    decoded_token = JWT.decode(bearer_token, "mys3cr3t", true, {algorithm: 'HS256'})
    puts decoded_token
  end

  def fetch_user
    puts "fetching user"
    puts session[:user_id]
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
    puts @current_user
  end
end
