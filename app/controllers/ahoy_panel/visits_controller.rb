module AhoyPanel
  class VisitsController < ApplicationController
    def all_time_dates
      start_date = ::Ahoy::Visit.order(started_at: :asc).first.started_at.to_date
      end_date = ::Ahoy::Visit.order(started_at: :desc).first.started_at.to_date

      render json: {
        start_date: start_date,
        end_date: end_date
      }
    end
  end
end
