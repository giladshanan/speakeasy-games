Rails.application.routes.draw do
  resources :games, only: [:index, :show]
  root to: "games#index"
end
