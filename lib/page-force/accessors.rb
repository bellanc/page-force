require 'page-object'
require 'selenium-webdriver'
require 'watir-webdriver'

module PageObject
  module Accessors
    def sfdc_cell(name, identifier, &block)
      sfdc_element = find_sfdc_field_metadata(identifier)
      cell(name, id: "#{sfdc_element.id}_ilecell", &block)
    end

    alias_method :sfdc_summary, :sfdc_cell

    def sfdc_text_field(name, identifier, &block)
      sfdc_element = find_sfdc_field_metadata(identifier)

      cell "#{name}_cell", id: "#{sfdc_element.id}_ilecell", &block
      text_field "#{name}_text_field", id: sfdc_element.id, &block


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

    def sfdc_text_area(name, identifier, &block)
      sfdc_element = find_sfdc_field_metadata(identifier)

      cell "#{name}_cell", id: "#{sfdc_element.id}_ilecell", &block
      text_area "#{name}_text_area", id: sfdc_element.id, &block


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


    def sfdc_button(name, identifier, &block)
      sfdc_element = find_sfdc_field_metadata(identifier)

      button(name, id: "#{sfdc_element.id}_ileinner", &block)
    end

    def sfdc_checkbox(name, identifier, &block)
      sfdc_element = find_sfdc_field_metadata(identifier)

      img("#{name}_image", id: "#{sfdc_element.id}_chkbox", &block)
      checkbox("#{name}_checkbox", id: sfdc_element.id, &block)

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

    def sfdc_select_list(name, identifier, &block)
      sfdc_element = find_sfdc_field_metadata(identifier)

      cell("#{name}_cell", id: "#{sfdc_element.id}_ilecell", &block)
      select_list("#{name}_select_list", id: sfdc_element.id, &block)

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
      sfdc_element = find_sfdc_field_metadata(identifier)

      link("#{name}_link", id: /lookup(.*)#{sfdc_element.id}/, &block)
      cell("#{name}_cell", id: "#{sfdc_element.id}_ilecell", &block)
      text_field("#{name}_text_field", id: sfdc_element.id, &block)

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

    alias_method :sfdc_email, :sfdc_link

    def sfdc_lookup(name, identifier, &block)
      sfdc_element = find_sfdc_field_metadata(identifier)


      link("#{name}_link", id: /lookup(.*)#{sfdc_element.id}/, &block)
      cell("#{name}_cell", id: "#{sfdc_element.id}_ilecell", &block)
      text_field("#{name}_text_field", id: "CF#{sfdc_element.id}", &block)

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

    def visualforce_page(name, section_class, visualforce_page_name)
      identifier = {title: visualforce_page_name}
      define_method(name) do
        platform.visualforce_page_for(identifier, section_class)
      end
    end

    def sfdc_related_list(name, section_class, identifier)
      label_text = identifier.fetch(:sflabel) { raise InvalidIdentifierExecption, "#{identifier.keys.first} is not a valid identifier for this element type." }

      define_method(name) do
        xpath_exact_label_match = "//h3[text() ='#{label_text}']"
        xpath_fuzzy_match = "//h3[contains(.,'#{label_text}')]"
        xpath_expression = element_exists_for_identifier?(xpath: xpath_exact_label_match) ? xpath_exact_label_match : xpath_fuzzy_match
        table_rows_xpath = "#{xpath_expression}//following::tbody[1]/tr[position()>1]"
        platform.pages_for({xpath: table_rows_xpath}, section_class)
      end

    end


    def find_sfdc_field_metadata(identifier)
      sfdc_field_name = identifier.fetch(:sfdc_field_name) { raise InvalidIdentifierExecption, "#{identifier.keys.first} is not a valid identifier for this element type." }
      self.custom_fields.find(-> { raise InvalidIdentifierExecption, "sfdc_field_name \"#{sfdc_field_name}\" not found." }) { |field| field.field_name == sfdc_field_name }
    end

    def sfdc_field_xpath_for(label)
      "//*[contains(.,'#{label}') and @class='labelCol']//following-sibling::*[contains(@class ,'dataCol') or contains(@class ,'data2Col')]"
    end
  end
end

class InvalidSFDCObjectTypeException < StandardError;
end
class SFDCElementMissingException < StandardError;
end
class InvalidIdentifierExecption < StandardError;
end