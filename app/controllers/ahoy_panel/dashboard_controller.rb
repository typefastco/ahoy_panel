module AhoyPanel
  class DashboardController < ApplicationController
    def index
      @visits = Ahoy::Visit.all
      @events = Ahoy::Event.all
      @visits_count = Ahoy::Visit.where("started_at > ?", 30.days.ago).size
      @events_count = Ahoy::Event.where("time > ?", 30.days.ago).size


      @unique_visitors_current = Ahoy::Visit.where(started_at: current_time_range)
      @unique_visitors_before = Ahoy::Visit.where(started_at: before_time_range)

      @total_visits_current = Ahoy::Visit.where(started_at: current_time_range)
      @total_visits_before = Ahoy::Visit.where(started_at: before_time_range)
    end

    private

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
