module AhoyPanel
  class VisitsController < ApplicationController
    def index
      @start_date = params[:start_date].to_date.beginning_of_day
      @end_date = params[:end_date].to_date.end_of_day

      @visits = ::Ahoy::Visit.where(started_at: @start_date..@end_date)

      render json: @visits
    end

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
