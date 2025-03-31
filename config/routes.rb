AhoyPanel::Engine.routes.draw do
  get "all_time_dates", to: "visits#all_time_dates"

  resources :visits, only: [:index, :show]
end
