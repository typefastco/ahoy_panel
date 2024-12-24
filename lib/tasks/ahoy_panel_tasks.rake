# desc "Explaining what the task does"
# task :ahoy_panel do
#   # Task goes here
# end

desc "Run Tailwind task"
namespace :tailwindcss do
  task :watch do
    require "tailwindcss-rails"
    require "tailwindcss/ruby"

    system "#{Tailwindcss::Ruby.executable} \
      -i #{AhoyPanel::Engine.root.join("app/assets/stylesheets/ahoy_panel/application.tailwind.css")} \
      -o #{AhoyPanel::Engine.root.join("app/assets/builds/ahoy_panel.css")} \
      -c #{AhoyPanel::Engine.root.join("config/tailwind.config.js")} \
      --minify \
      -w"
  end
end
