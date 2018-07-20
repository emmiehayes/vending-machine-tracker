Rails.application.routes.draw do
  root to: "owners#index"

  resources :items, only: [:show]

  resources :owners do
    resources :machines, only: [:index]
  end

  resources :machines, only: [:show]
end
