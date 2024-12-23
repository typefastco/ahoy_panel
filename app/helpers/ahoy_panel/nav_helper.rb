# frozen_string_literal: true

module AhoyPanel
  module NavHelper
    def active_nav_link?(page_name)
      if controller_name == page_name
        "bg-gray-100 text-gray-900"
      else
        "text-gray-900 hover:bg-gray-50 hover:text-gray-900"
      end
    end
  end
end
