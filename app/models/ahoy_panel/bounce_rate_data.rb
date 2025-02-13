module AhoyPanel
  class BounceRateData < BaseMetric
    def initialize(params:, base_collection:, date_column: :started_at)
      @params = params
      @base_collection = base_collection
      @date_column = date_column

      super(start_at:, end_at:)
    end

    def title
      "Bounce Rate"
    end

    # Calculates the bounce rate as the percentage of visits with only one pageview.
    def data
      total_visits = calculate_range(base_collection, start_at..end_at).count
      bounce_visits = calculate_range(base_collection, start_at..end_at)
                        .where("pageview = ?", 1)
                        .count
      total_visits.zero? ? 0 : (bounce_visits.to_f / total_visits * 100).round(2)
    end

    # Compares the current bounce rate with the previous interval and returns the percentage change.
    def change
      current_rate = data
      prev_range = calculate_previous_range(start_at..end_at)
      total_visits_prev = calculate_range(base_collection, prev_range).count
      bounce_visits_prev = calculate_range(base_collection, prev_range)
                             .where("pageview = ?", 1)
                             .count
      previous_rate = total_visits_prev.zero? ? 0 : (bounce_visits_prev.to_f / total_visits_prev * 100).round(2)
      compute_trend(current_rate, previous_rate)
    end

    private

    attr_reader :params, :base_collection, :date_column

    def range
      @range ||= determine_range
    end

    def start_at
      @start_at ||= range.first
    end

    def end_at
      @end_at ||= range.last
    end

    def calculate_range(collection, range)
      collection.where(date_column => range)
    end

    # Determines the date range from params; defaults to today if not provided.
    def determine_range
      start_date = parse_date(params[:start_date]) || Time.zone.now.beginning_of_day
      end_date   = parse_date(params[:end_date])   || Time.zone.now.end_of_day
      start_date.beginning_of_day..end_date.end_of_day
    end
  end
end
