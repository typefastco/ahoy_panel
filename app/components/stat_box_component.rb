# frozen_string_literal: true

class StatBoxComponent < ViewComponent::Base
  # TODO
  # Rails.application.routes.url_helpers.root_path

  delegate :heroicon, to: :helpers

  def initialize(title:, data:, change: nil)
    @title = title
    @data = data
    @change = change.to_f
  end
end
