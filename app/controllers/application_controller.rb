class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include ::ActionController::Cookies
  before_action :authenticate_user

  def bearer_token
    pattern = /^Bearer /
    header  = request.headers['Authorization']
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def authenticate_user
    decoded_token = JWT.decode(bearer_token, "mys3cr3t", true, {algorithm: 'HS256'})
  end
end
