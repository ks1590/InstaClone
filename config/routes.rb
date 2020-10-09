Rails.application.routes.draw do
  root "users#new"
  resources :posts, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
