require 'page-object'
require 'selenium-webdriver'
require 'watir-webdriver'

module PageObject
  module Accessors
    def sfdc_cell(name, identifier, &block)
      sfdc_label = identifier.fetch(:sfdc_label)
      cell(name, xpath: "//td[. = '#{sfdc_label}']/following::*[1]", &block)
    end

    alias_method :sfdc_summary, :sfdc_cell
    alias_method :sfdc_double, :sfdc_cell
    alias_method :sfdc_datetime, :sfdc_cell

    def sfdc_text_field(name, identifier, &block)
      sfdc_label = identifier.fetch(:sfdc_label)

      cell "#{name}_cell", xpath: "//td[. = '#{sfdc_label}']/following::*[1]", &block
      text_field "#{name}_text_field", xpath: "//td[. = '#{sfdc_label}']/following::input[@type='text']", &block


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
      sfdc_label = identifier.fetch(:sfdc_label)

      cell "#{name}_cell", xpath: "//td[. = '#{sfdc_label}']/following::*[1]", &block
      text_area "#{name}_text_area", xpath: "//td[. = '#{sfdc_label}']/following::*[1]", &block


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
      sfdc_label = identifier.fetch(:sfdc_label)

      button(name, xpath: "//td[. = '#{sfdc_label}']/following::*[1]", &block)
    end

    def sfdc_checkbox(name, identifier, &block)
      sfdc_label = identifier.fetch(:sfdc_label)

      img("#{name}_image", xpath: "//td[. = '#{sfdc_label}']/following::*[1]", &block)
      checkbox("#{name}_checkbox", xpath: "//td[. = '#{sfdc_label}']/following::*[1]", &block)

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
      sfdc_label = identifier.fetch(:sfdc_label)

      cell("#{name}_cell", xpath: "//td[. = '#{sfdc_label}']/following::*[1]", &block)
      select_list("#{name}_select_list", xpath: "//td[. = '#{sfdc_label}']/following::select", &block)

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
      sfdc_label = identifier.fetch(:sfdc_label)

      link("#{name}_link", xpath: "//td[. = '#{sfdc_label}']/following-sibling::td/a", &block)
      cell("#{name}_cell", xpath: "//td[. = '#{sfdc_label}']/following::*[1]", &block)
      text_field("#{name}_text_field", xpath: "//td[. = '#{sfdc_label}']/following::input[@type='text']", &block)

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
      sfdc_label = identifier.fetch(:sfdc_label)


      link("#{name}_link", xpath: "//td[. = '#{sfdc_label}']/following-sibling::td/a", &block)
      cell("#{name}_cell", xpath: "//td[. = '#{sfdc_label}']/following::*[1]", &block)
      text_field("#{name}_text_field", xpath: "//td[. = '#{sfdc_label}']/following::input[@type='text']", &block)

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
        send("#{name}_text_field?") || send("#{name}_link?") || send("#{name}_cell?")
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


  end
end

class InvalidSFDCObjectTypeException < StandardError;
end
class SFDCElementMissingException < StandardError;
end
class InvalidIdentifierExecption < StandardError;
end