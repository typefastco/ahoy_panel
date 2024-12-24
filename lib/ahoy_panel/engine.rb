require "importmap-rails"
require "turbo-rails"
require "stimulus-rails"

module AhoyPanel
  class Engine < ::Rails::Engine
    isolate_namespace AhoyPanel

    initializer "ahoy_panel.assets" do |app|
      app.config.assets.paths << root.join("app/javascript")
      app.config.assets.precompile += %w[ahoy_panel_manifest]
    end

    initializer "ahoy_panel.importmap", before: "importmap" do |app|
      app.config.importmap.paths << root.join("config/importmap.rb")
      app.config.importmap.cache_sweepers << root.join("app/javascript")
    end
  end
end
