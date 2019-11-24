class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include ::ActionController::Cookies

  def authenticate_user
    puts 'runs'
    jwt = cookies.signed[:jwt]
    decoded_token = JWT.decode(jwt, "mys3cr3t", true, {algorithm: 'HS256'})
    puts decoded_token
  end
end
