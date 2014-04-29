require 'cumber'

module Gametel
  module Platforms
    class CumberPlatform
      include Cumber

      def evaluate(property, locator)
        case property
          when :shown
            Cumber::Element.new(locator).visible?
          else
            nil
        end
      end

      def get_text(locator)
        Cumber::Element.new(locator).value
      end

      def enter_text(text, locator)
        Cumber::TextField.new(locator).set_value(text)
      end

      def press_button(locator)
        p locator
        p Cumber::Button.new(locator).type
        Cumber::Button.new(locator).tap
      end

      def has_text?(text)
        element = Cumber::Element.new(:name => text)
        return false unless is_text_element?(element)
        element.exists? and element.visible?
      end

      private
      def is_text_element?(element)
        element.type.eql?('UIAStaticText') or element.type.eql?('UIATextField')
      end
    end
  end
end
