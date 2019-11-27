Rails.application.config.middleware.insert_before 0, Rack::Cors do

  allow do
    origins 'http://localhost:3333'
    resource '*',
      :headers => :any,
      :expose => ["jwt"],
      :methods => %i( get post put patch delete options head ),
      :credentials => true
  end

  allow do
    origins 'https://client-tuesday-qdk2fbus7.now.sh/'
    resource '*',
      :headers => :any,
      :expose => ["jwt"],
      :methods => %i( get post put patch delete options head ),
      :credentials => true
  end

end
