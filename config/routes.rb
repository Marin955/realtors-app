Rails.application.routes.draw do
  resources :realtors, only: [:index]
  namespace :realtors do
    resources :search, only: [:index]
  end
end
