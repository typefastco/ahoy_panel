require "ahoy_panel/version"
require "ahoy_panel/engine"
require 'dry-configurable'

module AhoyPanel
  extend Dry::Configurable

  setting :api_key
end
