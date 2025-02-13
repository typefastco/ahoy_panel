# frozen_string_literal: true

module AhoyPanel
  module DropdownHelper
    def dropdown_item_groups
      items = AhoyPanel::TimeRangeFilter::INTERVALS.map do |key, method_name|
        { label: interval_label(key), url: dropdown_url(key) }
      end

      items.each_slice(2).to_a
    end

    def interval_label(key)
      AhoyPanel::TimeRangeFilter::LABELS[key.to_i] || key.to_s.capitalize
    end

    def dropdown_url(key)
      url_for(params.permit!.to_h.merge(interval: key))
    end
  end
end
