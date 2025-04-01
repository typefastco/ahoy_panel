require "ahoy_panel/version"
require "ahoy_panel/engine"
require "dry-configurable"
require "faraday"
require "kaminari"

module AhoyPanel
  extend Dry::Configurable

  setting :api_key
end
