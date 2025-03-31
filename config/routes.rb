AhoyPanel::Engine.routes.draw do
  get "views_data", to: "views_data#index"

  get "all_time_dates", to: "visits#all_time_dates"

  resources :visits, only: [:index]
end
