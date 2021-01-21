Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'westeros#index'
  get '/westeros', to: 'westeros#index'

  resources :users, only: [:create, :index]
  resources :sessions, only: [:create, :delete]
  resources :stocks, only: [:index, :show, :update]
  resources :spacs, only: [:index, :show]
  resources :stock_transactions, only: :index

  get :logout, to: "sessions#logout"

  get "westeros/*all", to: "westeros#index"
  get "assets/*all", to: "westeros#index"


  get '/auth/:provider/callback', to: 'sessions#create'
end
