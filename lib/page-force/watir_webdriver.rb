module PageObject
  module Platforms
    module WatirWebDriver
      class PageObject
        def visualforce_page_for(identifier, page_class)
          find_visualforce_watir_page(identifier, page_class)
        end

        def find_visualforce_watir_page(identifier, page_class)
          identifier, frame_identifiers = parse_identifiers(identifier, Elements::Element, 'element')
          element = @browser.instance_eval "#{nested_frames(frame_identifiers)}iframe(identifier)"
          switch_to_default_content(frame_identifiers)
          page_class.new(element)
        end
      end
    end
  end
end
