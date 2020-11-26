Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :topics
  resources :responses
  resources :users, only: [:create]

  get "westeros/*all", to: "westeros#index"
  get "assets/*all", to: "westeros#index"
end
