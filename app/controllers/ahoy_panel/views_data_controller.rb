module AhoyPanel
  class ViewsDataController < ApplicationController
    def index
      @start_date = params[:start_date].to_date.beginning_of_day
      @end_date = params[:end_date].to_date.end_of_day

      @visits = ::Ahoy::Visit.where(started_at: @start_date..@end_date)

      render json: @visits
    end
  end
end
