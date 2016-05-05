require "page-force/version"
require 'page-object'
require 'restforce'
require 'active_support'
require 'active_support/inflector'
require 'page-force/config'
require 'page-force/accessors'

module PageForce
  attr_accessor :custom_fields
  attr_reader :sfdc_object_id, :sfdc_object_name, :object_description

  SFDCObjectField = Struct.new(:field_name, :id)


  def self.included(base)
    base.include PageObject

    base.class_eval do

      def self.custom_fields
        @object_fields ||= []
      end

      def self.sfdc_object_name=(sfdc_object_name)
        @object_description = Config.sfdc_api_client.describe(sfdc_object_name)
      end

      def self.materialize_fields=(boolean_value)
        generate_page_objects_for_sfdc_object if boolean_value
      end

      private
      def self.generate_page_objects_for_sfdc_object
        @object_description.fields.each do |field|
          if field.type != 'multipicklist' && field.type != 'id'
            send("sfdc_#{field.type}", field.label.gsub(/\s+/, '_').gsub(/\s+/, '').underscore, sfdc_label: field.label)
          end
        end
      end
    end
  end
end


