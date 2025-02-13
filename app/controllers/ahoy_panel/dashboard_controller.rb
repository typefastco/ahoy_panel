module AhoyPanel
  class DashboardController < ApplicationController
    before_action :set_metrics, only: :index

    def index; end

    private

    def set_metrics
      set_interval_label
      set_initial_date
      set_all_visits
      set_unique_visitors_data
      set_total_visits_data
    end

    def set_interval_label
      @interval_label = AhoyPanel::IntervalLabel.selected_label(params: params)
    end

    def set_initial_date
      @selected_date ||= Time.zone.now.to_date
    end

    def set_all_visits
      @visits = Ahoy::Visit.all
    end

    def set_unique_visitors_data
      @unique_visitors_data = AhoyPanel::UniqueVisitorsData.create_to_params(
        params: params,
        base_collection: Ahoy::Visit.all,
        date_column: :started_at
      )
    end

    def set_total_visits_data
      @total_visits_data = AhoyPanel::TotalVisitsData.create_to_params(
        params: params,
        base_collection: Ahoy::Visit.all,
        date_column: :started_at
      )
    end
  end
end
