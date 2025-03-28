module AhoyPanel
  class ApplicationController < ActionController::Base
    before_action :authenticate_api_key!

    protected

    def authenticate_api_key!
      api_key = request.headers["Ahoy-Panel-Api-Key"]

      return true if Rails.env.development?

      ahoy_panel_root_url = "https://www.ahoypanel.com"

      client = Faraday.new(url: ahoy_panel_root_url) do |conn|
        conn.headers["Ahoy-Panel-Api-Key"] = "#{api_key}"
        conn.request :json
        conn.response :json
      end

      if !response.body["verified"]
        raise
      end
    end
  end
end
