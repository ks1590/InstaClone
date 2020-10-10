Rails.application.routes.draw do
  root "users#new"
  resources :posts, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    post :confirm, on: :collection
    post :member, on: :member
  end
end
