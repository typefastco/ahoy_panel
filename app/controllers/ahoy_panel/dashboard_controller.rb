module AhoyPanel
  class DashboardController < ApplicationController
    def index
      @dropdown_item_groups = [
        [{ label: "Today", url: "" }, { label: "Yesterday", url: "" }],
        [{ label: "Last 7 Days", url: "" }, { label: "Last 30 Days", url: "" }],
        [{ label: "Month to Date", url: "" }, { label: "Last Month", url: "" }],
        [{ label: "Year to Date", url: "" }, { label: "Last 12 Months", url: "" }],
        [{ label: "All Time", url: "" }, { label: "Custom Range", url: "" }],
        [{ label: "Compare", url: "" }],
      ]

      @selected_date = params[:selected_date]&.to_time&.to_date || Time.zone.now.to_date
      @date_range = date_range

      @visits = Ahoy::Visit.all
      @events = Ahoy::Event.all
      @visits_count = Ahoy::Visit.where("started_at > ?", 30.days.ago).size
      @events_count = Ahoy::Event.where("time > ?", 30.days.ago).size


      @unique_visitors_current = Ahoy::Visit.where(started_at: current_time_range)
      @unique_visitors_before = Ahoy::Visit.where(started_at: before_time_range)

      @total_visits_current = Ahoy::Visit.where(started_at: current_time_range)
      @total_visits_before = Ahoy::Visit.where(started_at: before_time_range)

      @unique_visitors_data = AhoyPanel::UniqueVisitorsData.new(
        start_at: date_range.start_at, end_at: date_range.end_at
      )
      @total_visits_data = AhoyPanel::TotalVisitsData.new(
        start_at: date_range.start_at, end_at: date_range.end_at
      )
      @total_pageviews_data = AhoyPanel::TotalPageviewsData.new(
        start_at: date_range.start_at, end_at: date_range.end_at
      )
    end

    private

    DateRange = Struct.new(:start_at, :end_at)

    def date_range
      return @date_range if defined?(@date_range)

      case params[:selected_date]
      when "blah"
      else
        @date_range = DateRange.new(Time.zone.now.beginning_of_day, Time.zone.now.end_of_day)
      end
    end

    def filter_date
      Time.zone.today
    end

    def before_date
      filter_date - 1.day
    end

    def current_time_range
      filter_date.beginning_of_day..filter_date.end_of_day
    end

    def before_time_range
      before_date.beginning_of_day..before_date.end_of_day
    end
  end
end
