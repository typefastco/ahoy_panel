module AhoyPanel
  class VisitsController < ApplicationController
    def index
      @start_date = params[:start_date].to_date.beginning_of_day
      @end_date = params[:end_date].blank? ? nil : params[:end_date].to_date.end_of_day
      @page = params[:page]
      @filtering_params = JSON.parse(params[:filtering_params], symbolize_names: true)

      @date_range = if @end_date.blank?
                      @start_date..params[:start_date].to_date.end_of_day
                    else
                      @start_date..@end_date
                    end

      @visits = ::Ahoy::Visit.where(started_at: @date_range).order(:id)

      @filtering_params.each do |key, value|
        case key
        when :id
          @visits = @visits.where(id: value.to_i)
        when :user_id
          @visits = @visits.where(user_id: value.to_i)
        when :referring_domain
          @visits = @visits.where("referring_domain ilike ?", "%#{value}%")
        when :country
          @visits = @visits.where("country ilike ?", "%#{value}%")
        when :city
          @visits = @visits.where("city ilike ?", "%#{value}%")
        when :region
          @visits = @visits.where("region ilike ?", "%#{value}%")
        end
      end

      if @page.present?
        @visits = @visits.page(@page)
      end

      render json: { visits: @visits, total_count: @page.present? ? @visits.total_count : nil }
    end

    def show
      @visit = ::Ahoy::Visit.find(params[:id])
      @events = @visit.events

      render json: { visit: @visit, events: @events }
    end

    def dates
      start_date = ::Ahoy::Visit.order(started_at: :asc).first.started_at.to_date
      end_date = ::Ahoy::Visit.order(started_at: :desc).first.started_at.to_date

      render json: {
        start_date: start_date,
        end_date: end_date
      }
    end
  end
end
