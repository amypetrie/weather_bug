Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get "/forecast", to: "location#index"
      get "/gifs", to: "daily_forecast#index"
      resources :users, only: [:new, :create]
    end
  end
end
