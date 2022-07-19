Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # resources :book

    resources :users, except: [:new] do
      resources :cars, only: [:index, :new, :create] 
    end

    resources :users do
      resources :books, only: [ :new, :create] 
    end
    
    resources :users do
      resources :articles, only: [ :new, :create] 
    end

    resources :cars, :only => [:show, :update, :destroy, :edit]
    resources :books, only: [:index, :show, :update, :destroy, :edit]
    resources :sessions, only: [:index, :show, :update, :edit, :new], except: [:destroy]
    resources :articles
end
