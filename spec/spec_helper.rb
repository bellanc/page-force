# encoding: utf-8
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

# require 'simplecov'
# require 'coveralls'
# SimpleCov.start { add_filter 'spec/' }

require 'rspec'
require 'watir-webdriver'
require 'selenium-webdriver'

require 'page-object'
require 'page-force'
include PageObject::PageFactory


CONNECTED_APP_DATA = YAML.load_file("#{Dir.home}/connected_app.yml")
Restforce.configure do |config|
  config.api_version =  "34.0"
  config.client_id = CONNECTED_APP_DATA[:app][:client_id]
  config.client_secret = CONNECTED_APP_DATA[:app][:client_secret]
end

TOOLING_API = Restforce.tooling username: CONNECTED_APP_DATA[:credentials][:admin][:username],
                                password: CONNECTED_APP_DATA[:credentials][:admin][:password],
                                security_token: CONNECTED_APP_DATA[:credentials][:admin][:security_token],
                                host: 'test.salesforce.com'


RESTFORCE_API = Restforce.new username: CONNECTED_APP_DATA[:credentials][:admin][:username],
                              password: CONNECTED_APP_DATA[:credentials][:admin][:password],
                              security_token: CONNECTED_APP_DATA[:credentials][:admin][:security_token],
                              host: 'test.salesforce.com'

PageForce::Config.sfdc_tooling_client = TOOLING_API
