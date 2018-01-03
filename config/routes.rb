Rails.application.routes.draw do
  resources :games, only: [:index, :show, :new, :edit, :update, :destroy]
  resources :photos, only: [:destroy]
  root to: "games#index"
end
