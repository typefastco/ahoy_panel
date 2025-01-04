# frozen_string_literal: true

module AhoyPanel
  class DropdownComponent < ViewComponent::Base
    def initialize(item_groups:, date: Time.zone.now.to_date)
      @item_groups = build_item_groups(item_groups)
      @label = humanize_date(date)
    end

    private

    Item = Struct.new(:label, :url, :class)

    CLASSES = {
      active: "block px-4 py-2 text-sm bg-gray-100 text-gray-900 outline-none hover:bg-gray-100",
      inactive: "block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
    }

    def build_item_groups(item_groups)
      item_groups.map do |items|
        items.map do |item|
          Item.new(item[:label], item[:url], CLASSES[:inactive])
        end
      end
    end

    def humanize_date(date)
      return "Today" if date.today?

      return "Yesterday" if date.yesterday?

      date
    end
  end
end
