AhoyPanel::Engine.routes.draw do
  resources :visits

  get "views_data", to: "views_data#index"
end
