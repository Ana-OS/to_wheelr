Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "pages#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :bicycles do
        resources :reviews, only: [:index, :new, :create]
      end
      resources :reviews, only: [:destroy, :show, :edit, :update]
    end
  end

  # post "/signup", to: "users#create"
  # get "/me", to: "users#show"
  # post "/login", to: "sessions#create"
  # delete "/logout", to: "sessions#destroy"

  # route other requests to the root path
  get "*path", to: "pages#index", via: :all
end
