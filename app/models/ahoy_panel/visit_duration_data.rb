module AhoyPanel
  class VisitDurationData < BaseMetric
    def initialize(params:, base_collection:, date_column: :started_at)
      @params = params
      @base_collection = base_collection
      @date_column = date_column

      super(start_at: start_at, end_at: end_at)
    end

    def title
      "Visit Duration"
    end

    # Returns the average visit duration (in seconds) for visits with a non-nil ended_at.
    def data
      visits = calculate_range(base_collection, start_at..end_at).where.not(ended_at: nil)
      return 0 if visits.empty?
      # Calculate total duration in seconds.
      total_duration = visits.sum { |visit| visit.ended_at - visit.started_at }
      (total_duration.to_f / visits.count).round(2)
    end

    # Calculates the percentage change in average visit duration compared to the previous similar interval.
    def change
      current_value = data
      prev_range = calculate_previous_range(start_at..end_at)
      prev_visits = base_collection.where(date_column => prev_range).where.not(ended_at: nil)
      return 0 if prev_visits.empty?
      previous_value = (prev_visits.sum { |visit| visit.ended_at - visit.started_at }.to_f / prev_visits.count).round(2)
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

    # Determines the date range from parameters.
    # If :start_date and :end_date are provided, they are used; otherwise, defaults to today.
    #
    # @return [Range] A Range from the beginning of the start date to the end of the end date.
    def determine_range
      start_date = parse_date(params[:start_date]) || Time.zone.now.beginning_of_day
      end_date   = parse_date(params[:end_date])   || Time.zone.now.end_of_day
      start_date.beginning_of_day..end_date.end_of_day
    end
  end
end
