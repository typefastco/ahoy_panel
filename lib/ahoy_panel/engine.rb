module AhoyPanel
  class Engine < ::Rails::Engine
    isolate_namespace AhoyPanel

    initializer "ahoy_panel.assets" do |app|
      app.config.assets.precompile += %w[ahoy_panel_manifest]
    end
  end
end
