module AhoyPanel
  class ApplicationController < ActionController::Base
    before_action :authenticate_api_key!

    protected

    def authenticate_api_key!
      api_key = request.headers["Ahoy-Panel-Api-Key"]

      ahoy_panel_root_url = if Rails.env.development?
                              "http://127.0.0.1:3000"
                            else
                              "https://www.ahoypanel.com"
                            end

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
