# frozen_string_literal: true

module AhoyPanel
  class StatBoxComponent < ViewComponent::Base
    delegate :heroicon, to: :helpers

    def initialize(title:, data:, change: nil)
      @title = title
      @data = data
      @change = change.to_f
    end
  end
end
