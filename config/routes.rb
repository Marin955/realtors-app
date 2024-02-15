Rails.application.routes.draw do
  resources :realtors, only: [:index] do
    collection do
      get :search
    end
  end
end
