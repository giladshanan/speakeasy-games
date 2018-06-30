Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' } #, confirmations: 'confirmations' }
  resources :users
  root to: "games#index"
  resources :games, only: [:index, :show, :new, :edit, :update, :destroy]
  resources :photos, only: [:destroy]
  resources :cover_photos, only: [:destroy]
  resources :testimonials, only: [:destroy]
  resources :charges
  resources :orders
  resources :invites
  resources :countdowns, only: [:create, :show, :index]
  get 'countdowns/:id/search' => 'countdowns#search', as: "search_path"
  get 'countdowns/:id/ending' => 'countdowns#ending', as: "ending_path"
end
