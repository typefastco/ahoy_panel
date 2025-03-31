module AhoyPanel
  class EventsController < ApplicationController
    def index
      @start_date = params[:start_date].to_date.beginning_of_day
      @end_date = params[:end_date].blank? ? nil : params[:end_date].to_date.end_of_day
      @page = params[:page]

      @date_range = if @end_date.blank?
                      @start_date..params[:start_date].to_date.end_of_day
                    else
                      @start_date..@end_date
                    end

      @events = ::Ahoy::Event.where(time: @date_range).order(:id)

      if @page.present?
        @events = @events.page(@page)
      end

      render json: { events: @events, total_count: @page.present? ? @events.total_count : nil }
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
