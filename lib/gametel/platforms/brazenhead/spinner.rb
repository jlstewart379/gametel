require 'brazenhead'

module Gametel
  module Platforms
    module Spinner
      
      def get_spinner_value_by_id(id)
        get_view_by_id(id) do |device|
          device.get_selected_item
          device.to_string
        end
      end
      
    end
  end
end