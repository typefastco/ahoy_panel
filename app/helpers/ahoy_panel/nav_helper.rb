# frozen_string_literal: true

module AhoyPanel
  module NavHelper
    def active_nav_link?(page_name)
      if controller_name == page_name
        "border-blue-500 text-gray-900"
      else
        "border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700"
      end
    end
  end
end
