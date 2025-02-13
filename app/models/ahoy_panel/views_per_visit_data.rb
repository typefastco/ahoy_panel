module AhoyPanel
  class ViewsPerVisitData < BaseMetric
    def initialize(params:, base_collection:, date_column: :started_at)
      @params = params
      @base_collection = base_collection
      @date_column = date_column

      super(start_at:, end_at:)
    end

    def title
      "Views Per Visit"
    end

    # Calculates the average number of pageviews per visit for the current interval.
    def data
      visits = Ahoy::Visit.where(started_at: start_at..end_at).count
      pageviews = Ahoy::Event.where(name: 'pageview', time: start_at..end_at).count
      visits.zero? ? 0 : (pageviews.to_f / visits).round(2)
    end

    # Compares the current average with that of the previous interval and computes the percentage change.
    def change
      current_value = data
      prev_range = calculate_previous_range(start_at..end_at)
      previous_visits = Ahoy::Visit.where(started_at: prev_range).count
      previous_pageviews = Ahoy::Event.where(name: 'pageview', time: prev_range).count
      previous_value = previous_visits.zero? ? 0 : (previous_pageviews.to_f / previous_visits).round(2)
      compute_trend(current_value, previous_value)
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

    def determine_range
      start_date = parse_date(params[:start_date]) || Time.zone.now.beginning_of_day
      end_date   = parse_date(params[:end_date])   || Time.zone.now.end_of_day
      start_date.beginning_of_day..end_date.end_of_day
    end
  end
end
