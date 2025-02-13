module AhoyPanel
  class DashboardController < ApplicationController
    before_action :set_metrics, only: :index
    def index; end

    private

    def set_metrics
      set_interval_label
      set_initial_date
      set_unique_visitors_data
      set_total_pageviews_data
      set_total_visits_data
      set_views_per_visit_data
      set_bounce_rate_data
      set_visit_duration_data
    end

    def set_interval_label
      @interval_label = AhoyPanel::IntervalLabel.selected_label(params:)
    end

    def set_initial_date
      @selected_date ||= Time.zone.now.to_date
    end

    def set_unique_visitors_data
      @unique_visitors_data = AhoyPanel::UniqueVisitorsData.create_to_params(
        params:,
        base_collection: Ahoy::Visit.all,
        date_column: :started_at
      )
    end

    def set_total_pageviews_data
      @total_pageviews_data = AhoyPanel::TotalPageviewsData.create_to_params(
        params:,
        base_collection: Ahoy::Event.all,
        date_column: :time
      )
    end

    def set_total_visits_data
      @total_visits_data = AhoyPanel::TotalVisitsData.create_to_params(
        params:,
        base_collection: Ahoy::Visit.all,
        date_column: :started_at
      )
    end

    def set_views_per_visit_data
      @views_per_visit_data = AhoyPanel::ViewsPerVisitData.create_to_params(
        params:,
        base_collection: nil,  # if not required, as queries go directly
        date_column: nil       # to Ahoy::Visit and Ahoy::Event
      )
    end

    def set_bounce_rate_data
      @bounce_rate_data = AhoyPanel::BounceRateData.create_to_params(
        params: params,
        base_collection: Ahoy::Visit.all,
        date_column: :started_at
      )
    end

    def set_visit_duration_data
      @visit_duration_data = AhoyPanel::VisitDurationData.create_to_params(
        params: params,
        base_collection: Ahoy::Visit.all,
        date_column: :started_at
      )
    end
  end
end
