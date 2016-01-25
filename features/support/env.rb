$LOAD_PATH << File.join(__dir__, '..', '..')

require 'page-force'
require 'restforce_client'

CONNECTED_APP_DATA = YAML.load_file("#{Dir.home}/connected_app.yml")

#Establish the client
ActiveForce.sfdc_client = RestForceClient.establish_connection_to_rest_api
PageForce::Config.sfdc_tooling_client = RestForceClient.establish_connection_to_tooling_api

World PageObject::PageFactory