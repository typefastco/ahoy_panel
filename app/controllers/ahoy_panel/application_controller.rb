module AhoyPanel
  class ApplicationController < ActionController::Base
    before_action :authenticate_api_key!

    protected

    def authenticate_api_key!
      api_key = request.headers["Ahoy-Panel-Api-Key"].remove("Bearer").squish

      raise if api_key != ::AhoyPanel.config.api_key
    end
  end
end
