require 'restforce'

class RestForceClient

  def self.establish_connection_to_rest_api
    #Configure Restforce with your connected app
    connected_app = YAML.load_file("#{Dir.home}/connected_app.yml")
    Restforce.configure do |config|
      config.api_version = "28.0"
      config.client_id = connected_app[:app][:client_id]
      config.client_secret = connected_app[:app][:client_secret]
    end

    #Establish a connection
    Restforce.new username: connected_app[:credentials][:admin][:username],
                  password: connected_app[:credentials][:admin][:password],
                  security_token: connected_app[:credentials][:admin][:security_token]
  end

  def self.establish_connection_to_tooling_api
    #Configure Restforce with your connected app
    connected_app = YAML.load_file("#{Dir.home}/connected_app.yml")
    Restforce.configure do |config|
      config.api_version = "28.0"
      config.client_id = connected_app[:app][:client_id]
      config.client_secret = connected_app[:app][:client_secret]
    end

    #Establish a connection
    Restforce.tooling username: connected_app[:credentials][:admin][:username],
                      password: connected_app[:credentials][:admin][:password],
                      security_token: connected_app[:credentials][:admin][:security_token]
  end
end