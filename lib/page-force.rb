require "page-force/version"
require 'page-object'
require 'restforce'
require 'active_support'
require 'active_support/inflector'
require 'page-force/config'
require 'page-force/accessors'
require 'page-force/standard_object'

module PageForce
  attr_accessor :custom_fields
  attr_reader :sfdc_object_id, :sfdc_object_name

  SFDCObjectField = Struct.new(:field_name, :id)


  def self.included(base)
    base.include PageObject

    base.class_eval do

      def self.custom_fields
        @custom_fields ||= []
      end

      def self.sfdc_object_id_for_developer_name(object_developer_name)
        sfdc_object_meta_data = Config.sfdc_tooling_client.query("Select Id From CustomObject where DeveloperName = '#{object_developer_name}'").first
        @sfdc_object_name = object_developer_name
        @sfdc_object_id = sfdc_object_meta_data ? sfdc_object_meta_data.Id : object_developer_name
      end

      def self.custom_field_metadata_for_sfdc_object(object_developer_name)
        sfdc_object_id = self.sfdc_object_id_for_developer_name(object_developer_name)
        sfdc_field_meta_data = Config.sfdc_tooling_client.query("Select Id, DeveloperName From CustomField Where TableEnumOrId = '#{sfdc_object_id}'")
        raise "Salesforce Object with Label Name \"#{object_developer_name}\" does not exist!" if sfdc_field_meta_data.nil?
        sfdc_field_meta_data
      end


      def self.sfdc_object_name=(sfdc_object_name)
        object_developer_name = sfdc_object_name.strip.gsub(' ', '_')
        meta_data = self.custom_field_metadata_for_sfdc_object(object_developer_name)
        @custom_fields = meta_data.map do |field|
          SFDCObjectField.new(field.DeveloperName, field.Id[0..14])
        end
        sfdc_object_name
      end
    end
  end
end


