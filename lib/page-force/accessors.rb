require 'page-object'
require 'selenium-webdriver'
require 'watir-webdriver'

module PageObject
  module Accessors
    def sfdc_cell(name, identifier, &block)
      sfdc_element_id = find_sfdc_field_id(identifier)
      cell(name, id: /#{sfdc_element_id}/, &block)
    end

    alias_method :sfdc_summary, :sfdc_cell
    alias_method :sfdc_double, :sfdc_cell
    alias_method :sfdc_datetime, :sfdc_cell

    def sfdc_text_field(name, identifier, &block)
      sfdc_element_id = find_sfdc_field_id(identifier)

      cell "#{name}_cell", id: /#{sfdc_element_id}/, &block
      text_field "#{name}_text_field", id: sfdc_element_id, &block


      define_method("#{name}_element") do
        send("#{name}_text_field?") ? send("#{name}_text_field_element") : send("#{name}_cell_element")
      end

      define_method("#{name}?") do
        send("#{name}_text_field?") || send("#{name}_cell?")
      end

      define_method(name) do
        send("#{name}_text_field?") ? send("#{name}_text_field") : send("#{name}_cell")
      end

      define_method("#{name}=") do |value|
        send("#{name}_text_field=", value)
      end
    end

    alias_method :sfdc_number, :sfdc_text_field
    alias_method :sfdc_text, :sfdc_text_field
    alias_method :sfdc_string, :sfdc_text_field
    alias_method :sfdc_date, :sfdc_text_field
    alias_method :sfdc_currency, :sfdc_text_field
    alias_method :sfdc_phone, :sfdc_text_field
    alias_method :sfdc_int, :sfdc_text_field
    alias_method :sfdc_address, :sfdc_text_field
    alias_method :sfdc_percent, :sfdc_text_field

    def sfdc_text_area(name, identifier, &block)
      sfdc_element_id = find_sfdc_field_id(identifier)

      cell "#{name}_cell", id: /#{sfdc_element_id}/, &block
      text_area "#{name}_text_area", id: sfdc_element_id, &block


      define_method("#{name}_element") do
        send("#{name}_text_area?") ? send("#{name}_text_area_element") : send("#{name}_cell_element")
      end

      define_method("#{name}?") do
        send("#{name}_text_area?") || send("#{name}_cell?")
      end

      define_method(name) do
        send("#{name}_text_area?") ? send("#{name}_text_area") : send("#{name}_cell")
      end

      define_method("#{name}=") do |value|
        send("#{name}_text_area=", value)
      end
    end

    alias_method :sfdc_text_area_encrypted, :sfdc_text_area
    alias_method :sfdc_textarea, :sfdc_text_area


    def sfdc_button(name, identifier, &block)
      sfdc_element_id = find_sfdc_field_id(identifier)

      button(name, id: "#{sfdc_element_id}_ileinner", &block)
    end

    def sfdc_checkbox(name, identifier, &block)
      sfdc_element_id = find_sfdc_field_id(identifier)

      img("#{name}_image", id: "#{sfdc_element_id}_chkbox", &block)
      checkbox("#{name}_checkbox", id: sfdc_element_id, &block)

      define_method("#{name}_element") do
        send("#{name}_checkbox?") ? send("#{name}_checkbox_element") : send("#{name}_image_element")
      end

      define_method("#{name}?") do
        send("#{name}_checkbox?") || send("#{name}_image?")
      end

      define_method("check_#{name}") do
        send("check_#{name}_checkbox")
      end

      define_method("uncheck_#{name}") do
        send("uncheck_#{name}_checkbox")
      end

      define_method("#{name}_checked?") do
        send("#{name}_checkbox?") ? send("#{name}_checkbox_checked?") : send("#{name}_image_element").title == 'Checked'
      end
    end

    alias_method :sfdc_boolean, :sfdc_checkbox

    def sfdc_select_list(name, identifier, &block)
      sfdc_element_id= find_sfdc_field_id(identifier)

      cell("#{name}_cell", id: /#{sfdc_element_id}/, &block)
      select_list("#{name}_select_list", id: sfdc_element_id, &block)

      define_method("#{name}_element") do
        send("#{name}_select_list?") ? send("#{name}_select_list_element") : send("#{name}_cell_element")
      end

      define_method("#{name}?") do
        send("#{name}_select_list?") || send("#{name}_cell?")
      end

      define_method(name) do
        send("#{name}_select_list?") ? send("#{name}_select_list") : send("#{name}_cell")
      end

      define_method("#{name}=") do |value|
        send("#{name}_select_list=", value)
      end

      define_method("#{name}_options") do
        self.send("#{name}_select_list_options")
      end
    end

    alias_method :sfdc_select, :sfdc_select_list
    alias_method :sfdc_picklist, :sfdc_select_list


    def sfdc_link(name, identifier, &block)
      sfdc_element_id= find_sfdc_field_id(identifier)

      link("#{name}_link", id: /lookup(.*)#{sfdc_element_id}/, &block)
      cell("#{name}_cell", id: /#{sfdc_element_id}/, &block)
      text_field("#{name}_text_field", id: sfdc_element_id, &block)

      define_method("#{name}_element") do
        if send("#{name}_text_field?")
          send("#{name}_text_field_element")
        elsif send("#{name}_link?")
          send("#{name}_link_element")
        else
          send("#{name}_cell_element")
        end
      end

      define_method("#{name}?") do
        send("#{name}_text_field?") ||  send("#{name}_link?") || send("#{name}_cell?")
      end

      define_method(name) do
        if send("#{name}_text_field?")
          send("#{name}_text_field")
        elsif send("#{name}_link?")
          send("#{name}_link")
        else
          send("#{name}_cell")
        end
      end

      define_method("#{name}=") do |value|
        send("#{name}_text_field=", value)
      end
    end

    alias_method :sfdc_email, :sfdc_link
    alias_method :sfdc_url, :sfdc_link

    def sfdc_lookup(name, identifier, &block)
      sfdc_element_id= find_sfdc_field_id(identifier)


      link("#{name}_link", id: /lookup(.*)#{sfdc_element_id}/, &block)
      cell("#{name}_cell", id: /#{sfdc_element_id}/, &block)
      text_field("#{name}_text_field", id: "CF#{sfdc_element_id}", &block)

      define_method("#{name}_element") do
        if send("#{name}_text_field?")
          send("#{name}_text_field_element")
        elsif send("#{name}_link?")
          send("#{name}_link_element")
        else
          send("#{name}_cell_element")
        end
      end

      define_method("#{name}?") do
        send("#{name}_text_field?") || "#{name}_link?" || send("#{name}_cell?")
      end

      define_method(name) do
        if send("#{name}_text_field?")
          send("#{name}_text_field")
        elsif send("#{name}_link?")
          send("#{name}_link")
        else
          send("#{name}_cell")
        end
      end

      define_method("#{name}=") do |value|
        send("#{name}_text_field=", value)
      end
    end

    alias_method :sfdc_lookup_field, :sfdc_lookup
    alias_method :sfdc_masterdetail, :sfdc_lookup
    alias_method :sfdc_reference, :sfdc_lookup

    def visualforce_page(identifier, embedded_visualforce_page=nil, &block)
      visualforce_page_name = identifier.fetch(:visualforce_name) { raise InvalidIdentifierExecption, "#{identifier.keys.first} is not a valid identifier for this element type." }
      in_iframe({title: visualforce_page_name}, embedded_visualforce_page, &block)
    end

    def sfdc_related_list(name, related_list_class, identifier)
      sfdc_object_name = identifier.fetch(:sfdc_object_name) { raise InvalidIdentifierExecption, "#{identifier.keys.first} is not a valid identifier for this element type." }
      related_object_id = sfdc_object_id_for_developer_name(sfdc_object_name)
      related_list_id = "#{@sfdc_object_id}_#{related_object_id}"
      page_section("#{name}_section", related_list_class, id: related_list_id)
      define_method(name) do
        send("#{name}_section")
      end
    end

    private
    def find_sfdc_field_id(identifier)
      raise "sfdc_object_name not set for page class" unless @sfdc_object_name

      if identifier.has_key? :sfdc_field_name
        sfdc_field_name = identifier.fetch :sfdc_field_name
        field_metadata = self.object_fields.find(-> { raise InvalidIdentifierExecption, "sfdc_field_name \"#{sfdc_field_name}\" not found." }) { |field| field.field_name == sfdc_field_name }
        sfdc_field_id = field_metadata.id
      elsif identifier.has_key? :sfdc_field_id
        sfdc_field_id = identifier.fetch :sfdc_field_id
      else
        raise InvalidIdentifierExecption, "#{identifier.keys.first} is not a valid identifier for this element type."
      end
      sfdc_field_id
    end
  end
end

class InvalidSFDCObjectTypeException < StandardError;
end
class SFDCElementMissingException < StandardError;
end
class InvalidIdentifierExecption < StandardError;
end