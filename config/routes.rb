Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "api/v1/bicycles#index", defaults: { format: :json }
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :bicycles do
        resources :reviews, only: [:index, :show, :new, :create]
      end
      resources :reviews, only: [:destroy, :edit, :update]
    end
  end

end
