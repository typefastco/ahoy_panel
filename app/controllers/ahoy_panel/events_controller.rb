module AhoyPanel
  class EventsController < ApplicationController
    def index
      @start_date = params[:start_date].to_date.beginning_of_day
      @end_date = params[:end_date].to_date.end_of_day
      @page = params[:page]

      @events = ::Ahoy::Event.where(time: @start_date..@end_date).order(:id)

      if @page.present?
        @events = @visits.page(@page)
      end

      render json: { events: @events, total_count: @page.present? ? @visits.total_count : nil }
    end

    def dates
      start_date = ::Ahoy::Event.order(time: :asc).first.time.to_date
      end_date = ::Ahoy::Event.order(time: :desc).first.time.to_date

      render json: {
        start_date: start_date,
        end_date: end_date
      }
    end
  end
end
