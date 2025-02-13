module AhoyPanel
  class TimeRangeFilter
    INTERVALS = {
      0 => :today,
      1 => :yesterday,
      2 => :last_7_days,
      3 => :last_30_days,
      4 => :month_to_date,
      5 => :last_month,
      6 => :year_to_date,
      7 => :last_12_months,
      8 => :all_time,
      9 => :custom
    }.freeze

    LABELS = {
      0 => "Today",
      1 => "Yesterday",
      2 => "Last 7 Days",
      3 => "Last 30 Days",
      4 => "Month to Date",
      5 => "Last Month",
      6 => "Year to Date",
      7 => "Last 12 Months",
      8 => "All Time",
      9 => "Custom Range"
    }.freeze

    DEFAULT_INTERVAL = 0

    def self.apply_interval(*args, **kwargs, &block)
      new(*args, **kwargs, &block).apply_interval
    end

    # Initialize with parameters, a base collection, and an optional date column.
    #
    # @param params [Hash] the parameters containing the interval and, for custom ranges, :start_date and :end_date.
    # @param base_collection [ActiveRecord::Relation] the collection to apply the filter to.
    # @param date_column [Symbol] the column name used for filtering (defaults to :started_at).
    def initialize(params, base_collection, date_column = :started_at)
      @params = params
      @base_collection = base_collection
      @date_column = date_column
    end

    # Determines which interval to apply based on the params.
    # Returns an array [selected_interval_label, count, trend], where:
    #   selected_interval_label - the name of the selected interval (e.g. "Today", "Last 7 Days"),
    #   count                   - the number of objects in the current interval,
    #   trend                   - the percentage change compared to the previous similar interval.
    def apply_interval
      [selected_interval_label, result[:count], result[:trend]]
    end

    private

    def interval_key
      @interval_key ||= parse_interval(@params[:interval])
    end

    def selected_interval_label
      LABELS[interval_key] || interval_key.to_s.capitalize
    end

    def find_result
      respond_to?(INTERVALS[interval_key], true) ? send(INTERVALS[interval_key]) : today
    end

    def result
      @result ||= find_result
    end

    # Converts the provided interval parameter to an integer and validates it against INTERVALS.
    def parse_interval(value)
      int_val = value.to_i
      INTERVALS.key?(int_val) ? int_val : DEFAULT_INTERVAL
    end

    # Parses a date from a given value; returns nil if parsing fails.
    def parse_date(value)
      return nil if value.blank?
      Date.parse(value.to_s)
    rescue ArgumentError
      nil
    end

    # Calculates the percentage change between current and previous counts.
    def calculate_percentage(current, previous)
      if previous.zero?
        current > 0 ? 100.0 : 0.0
      else
        ((current - previous) / previous.to_f * 100.0).round(2)
      end
    end

    # Helper method that returns a hash with :count and :trend for the given intervals.
    def with_previous_interval(current_range, previous_range)
      current_count = @base_collection.where(@date_column => current_range).count
      previous_count = @base_collection.where(@date_column => previous_range).count
      { count: current_count, trend: calculate_percentage(current_count, previous_count) }
    end

    def today
      current_range = Time.zone.now.beginning_of_day..Time.zone.now.end_of_day
      previous_range = 1.day.ago.beginning_of_day..1.day.ago.end_of_day
      with_previous_interval(current_range, previous_range)
    end

    def yesterday
      current_range = 1.day.ago.beginning_of_day..1.day.ago.end_of_day
      previous_range = 2.days.ago.beginning_of_day..2.days.ago.end_of_day
      with_previous_interval(current_range, previous_range)
    end

    def last_7_days
      current_range = 7.days.ago.beginning_of_day..Time.zone.now.end_of_day
      previous_range = 14.days.ago.beginning_of_day..7.days.ago.end_of_day
      with_previous_interval(current_range, previous_range)
    end

    def last_30_days
      current_range = 30.days.ago.beginning_of_day..Time.zone.now.end_of_day
      previous_range = 60.days.ago.beginning_of_day..30.days.ago.end_of_day
      with_previous_interval(current_range, previous_range)
    end

    # "Month to Date": current interval is from the beginning of the month until now.
    # Previous interval is from the beginning of the previous month until the same day.
    def month_to_date
      current_range = Time.zone.now.beginning_of_month..Time.zone.now.end_of_day
      days_elapsed = Time.zone.now.day - 1
      previous_start = Time.zone.now.last_month.beginning_of_month
      previous_range = previous_start..(previous_start + days_elapsed.days).end_of_day
      with_previous_interval(current_range, previous_range)
    end

    def last_month
      previous_month = Time.zone.now.last_month
      current_range = previous_month.beginning_of_month..previous_month.end_of_month
      month_before = previous_month - 1.month
      previous_range = month_before.beginning_of_month..month_before.end_of_month
      with_previous_interval(current_range, previous_range)
    end

    # "Year to Date": current interval is from the beginning of the year until now.
    # Previous interval is from the beginning of last year until the same day.
    def year_to_date
      current_range = Time.zone.now.beginning_of_year..Time.zone.now.end_of_day
      days_elapsed = Time.zone.now.yday - 1
      previous_start = Time.zone.now.last_year.beginning_of_year
      previous_range = previous_start..(previous_start + days_elapsed.days).end_of_day
      with_previous_interval(current_range, previous_range)
    end

    def last_12_months
      current_range = 1.year.ago.beginning_of_day..Time.zone.now.end_of_day
      previous_range = 2.years.ago.beginning_of_day..1.year.ago.end_of_day
      with_previous_interval(current_range, previous_range)
    end

    # "All Time": for this interval, no previous comparison is performed.
    def all_time
      count = @base_collection.count
      { count: count, trend: 0.0 }
    end

    # "Custom": uses provided :start_date and :end_date parameters.
    # The previous interval is the same duration immediately preceding the current interval.
    def custom
      start_date = parse_date(@params[:start_date]) || Time.zone.now.beginning_of_day
      end_date   = parse_date(@params[:end_date])   || Time.zone.now.end_of_day
      current_range = start_date.beginning_of_day..end_date.end_of_day
      duration = end_date.end_of_day - start_date.beginning_of_day
      previous_range = (start_date - duration).beginning_of_day..(end_date - duration).end_of_day
      with_previous_interval(current_range, previous_range)
    end
  end
end
