pin "application-ahoy-panel", to: "ahoy_panel/application.js", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from AhoyPanel::Engine.root.join("app/javascript/ahoy_panel/controllers"), under: "controllers", to: "ahoy_panel/controllers"
pin "el-transition" # @0.0.7
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
