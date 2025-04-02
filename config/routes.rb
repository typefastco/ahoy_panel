AhoyPanel::Engine.routes.draw do
  get "visit_dates", to: "visits#dates"
  resources :visits, only: [:index, :show]

  get "event_dates", to: "events#dates"
  resources :events, only: [:index, :show]
end
