module AhoyPanel
  module MetricsScope
    # Returns the count of records in the given collection for the specified time range on the given column.
    def count_for(collection, column, start_at, end_at)
      collection.where(column => start_at..end_at).count
    end

    # Computes the percentage change between current and previous values.
    def compute_trend(current, previous)
      if previous.zero?
        current > 0 ? 100.0 : 0.0
      else
        ((current - previous) / previous.to_f * 100.0).round(2)
      end
    end

    # Given a current range, calculates the previous range (shifting back by the same duration).
    def calculate_previous_range(range)
      duration = range.last - range.first
      (range.first - duration)..(range.last - duration)
    end
  end
end
