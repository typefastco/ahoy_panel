module AhoyPanel
  class DashboardController < ApplicationController
    def index
      # The service now returns an array: [selected_interval_label, count, trend]
      @selected_interval, @visits_count, @visits_trend = AhoyPanel::TimeRangeFilter.apply_interval(params, Ahoy::Visit.all, :started_at)
      @selected_interval, @events_count, @events_trend = AhoyPanel::TimeRangeFilter.apply_interval(params, Ahoy::Event.all, :time)
    end
end
