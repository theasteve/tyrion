Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :index]
  resources :sessions, only: [:create, :delete]
  resources :stocks, except: [:create, :update]

  get :logout, to: "sessions#logout"

  get "westeros/*all", to: "westeros#index"
  get "assets/*all", to: "westeros#index"
end
