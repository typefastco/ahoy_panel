# frozen_string_literal: true

module AhoyPanel
  class DateArrowNavigatorComponent < ViewComponent::Base
    def initialize(date: Time.zone.now.to_date)
      @right_disabled = date.today?

      @left_url = "/ahoy_panel?selected_date=#{date - 1.day}"
      @right_url = "/ahoy_panel?selected_date=#{date + 1.day}"
    end
  end
end
