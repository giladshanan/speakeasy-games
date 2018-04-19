Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' } #, confirmations: 'confirmations' }
  resources :users
  root to: "games#index"
  resources :games, only: [:index, :show, :new, :edit, :update, :destroy]
  resources :photos, only: [:destroy]
  resources :charges
  resources :orders
  resources :countdowns, only: [:create, :show, :index]
  get 'countdowns/:id/search' => 'countdowns#search'
end
