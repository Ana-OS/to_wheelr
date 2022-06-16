Rails.application.routes.draw do
  devise_for :users
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

  # route requests that dont match any api route to the root path
  get "*path", to: "pages#index", via: :all
end
