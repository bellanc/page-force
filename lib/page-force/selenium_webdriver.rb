module Platforms
  module SeleniumWebDriver
    class PageObject
      def visualforce_page_for(identifier, page_class)
        find_visualforce_selenium_page(identifier, page_class)
      end

      def find_visualforce_selenium_page(identifier, page_class)
        type, tag = Elements::Element, 'element'
        regexp = delete_regexp(identifier)
        how, what, frame_identifiers = parse_identifiers(identifier, type, tag)
        switch_to_frame(frame_identifiers)
        begin
          unless regexp
            element = @browser.find_element(how, what)
          else
            elements = @browser.find_elements(how, what)
            element = elements.find { |ele| matches_selector?(ele, regexp[0], regexp[1]) }
          end
        rescue Selenium::WebDriver::Error::NoSuchElementError
          @browser.switch_to.default_content unless frame_identifiers.nil?
          return build_null_object(identifier, type, tag, nil)
        end
        @browser.switch_to.default_content unless frame_identifiers.nil?
        page_class.new(element)
      end
    end
  end
end