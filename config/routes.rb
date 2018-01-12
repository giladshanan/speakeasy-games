Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: "games#index"
  resources :games, only: [:index, :show, :new, :edit, :update, :destroy]
  resources :photos, only: [:destroy]
  resources :charges
  resources :orders, only: [:show]
end
