AhoyPanel::Engine.routes.draw do
  get "all_time_dates", to: "visits#all_time_dates"

  get "views_data", to: "views_data#index"
end
