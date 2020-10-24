Rails.application.routes.draw do

  root 'welcome#home'

  resources :plant_logs
  
  resources :owned_plants

  resources :users do 
    resources :owned_plants do 
      resources :plant_logs
    end 
  end 

  resources :plants do 
    resources :owned_plants
  end 

  get "alive", to: "owned_plants#alive", as: "alive"

  resources :users, only: [:create, :show, :edit, :update]
  resources :plants

  get "signup", to: "users#new", as: "signup"

  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"

  delete "sessions", to: "sessions#destroy", as: "logout"
  
  # get 'auth/github', :as => 'github_auth'
  
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
