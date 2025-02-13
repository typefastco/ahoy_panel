module AhoyPanel
  class UniqueVisitorsData < BaseMetric
    def initialize(params:, base_collection:, date_column: :started_at)
      @params = params
      @base_collection = base_collection
      @date_column = date_column

      super(start_at:, end_at:)
    end

    def title
      "Unique Visitors"
    end

    def data
      @data ||= calculate_range(base_collection, start_at..end_at).distinct.count(:visitor_token)
    end

    # Calculates the percentage change compared to the previous similar interval.
    def change
      current_count = data
      prev_range = calculate_previous_range(start_at..end_at)
      previous_count = calculate_range(base_collection, prev_range).distinct.count(:visitor_token)
      compute_trend(current_count, previous_count)
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

    # Determines the date range from parameters.
    # If :start_date and :end_date are provided, they are used; otherwise, defaults to today.
    #
    # @param params [Hash] The request parameters.
    # @return [Range] A Range from the beginning of the start date to the end of the end date.
    def determine_range
      start_date = parse_date(params[:start_date]) || Time.zone.now.beginning_of_day
      end_date   = parse_date(params[:end_date])   || Time.zone.now.end_of_day
      start_date.beginning_of_day..end_date.end_of_day
    end
  end
end
