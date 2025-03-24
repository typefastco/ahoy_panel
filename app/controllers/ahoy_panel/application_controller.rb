module AhoyPanel
  class ApplicationController < ActionController::Base
    before_action :authenticate_api_key!

    protected

    def authenticate_api_key!
      api_key = request.headers["Ahoy-Panel-Api-Key"]

      return true if Rails.env.development?

      ahoy_panel_root_url = "https://www.ahoypanel.com"

      client = Faraday.new(url: ahoy_panel_root_url) do |conn|
        conn.headers["Ahoy-Panel-Api-Key"] = "asdf #{api_key}"
        conn.request :json
        conn.response :json
      end

      response = client.get("/api_key_verify")

      client = Faraday.new(url: ahoy_panel_root_url)

      if !response.body["verified"]
        client.get("/invalid_api_key")
      end
    end
  end
end
