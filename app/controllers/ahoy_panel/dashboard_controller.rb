module AhoyPanel
  class DashboardController < ApplicationController
    def index
      @visits_count = Ahoy::Visit.where("started_at > ?", 30.days.ago).size
      @events_count = Ahoy::Event.where("time > ?", 30.days.ago).size
    end
  end
end
