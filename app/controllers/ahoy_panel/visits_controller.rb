module AhoyPanel
  class VisitsController < ApplicationController
    def index
      @visits = ::Ahoy::Visit.all

      render json: @visits
    end
  end
end
