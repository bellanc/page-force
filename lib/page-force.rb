require "page-force/version"
require 'page-object'
require 'restforce'
require 'active_support'
require 'active_support/inflector'
require 'page-force/config'
require 'page-force/accessors'

module PageForce
  SFDCObjectField = Struct.new(:field_name, :id)
  def self.included(base)
    base.include PageObject

    base.class_eval do
      @standard_fields = [SFDCObjectField.new(field_name:'CreatedBy', id: 'CreatedBy'),
                          SFDCObjectField.new(field_name:'CreatedDate', id: 'CreatedDate'),
                          SFDCObjectField.new(field_name:'LastModifiedBy', id: 'LastModifiedBy'),
                          SFDCObjectField.new(field_name:'LastModifiedDate', id: 'LastModifiedDate'),
                          SFDCObjectField.new(field_name:'Owner', id: 'Owner'),
                          SFDCObjectField.new(field_name:'Name', id: 'Name'),
                          SFDCObjectField.new(field_name:'Currency', id: 'Currency'),
                          SFDCObjectField.new(field_name:'Division', id: 'Division')]


      def self.custom_fields
        @custom_fields ||= []
      end

      def self.custom_fields=(value)
        @custom_fields = value
      end

      def self.object_label=(sfdc_object_name)
        object_developer_name = sfdc_object_name.strip.gsub(' ', '_')
        sfdc_object_data = Config.sfdc_tooling_client.query("Select Id, DeveloperName, NamespacePrefix
                                                         From CustomObject where DeveloperName = '#{object_developer_name}'").first
        raise "Salesforce Object with Label Name #{sfdc_object_name} does not exist!" if sfdc_object_data.nil?
        meta_data = Config.sfdc_tooling_client.query("Select Id, DeveloperName
                                        From CustomField Where TableEnumOrId = '#{sfdc_object_data.Id}'")

        self.custom_fields = meta_data.map do |field|
          SFDCObjectField.new(field.DeveloperName, field.Id[0..14])
        end.concat(@standard_fields)

      end
    end
  end
end
