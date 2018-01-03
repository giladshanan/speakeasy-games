Rails.application.routes.draw do
  resources :games, only: [:index, :show, :new, :edit, :update]
  root to: "games#index"
end
