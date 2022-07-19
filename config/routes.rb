Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  get 'signup', to: 'users#new'

  # resources :book

    resources :users, except: [:new] do
      resources :cars, only: [:index, :new, :create] 
    end

    resources :users do
      resources :books, only: [ :new, :create] 
    end

    resources :cars, :only => [:show, :update, :destroy, :edit]
    resources :books, only: [:index, :show, :update, :destroy, :edit]
end
