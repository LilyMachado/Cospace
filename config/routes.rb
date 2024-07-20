Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :workspaces do
    member do
      get 'availability', to: 'workspace#edit_availability'
      patch 'availability', to: 'workspace#update_availability'
    end
    resources :reviews, only: [:index, :new, :create]
  end
  resources :bookings,
  resources :users, only: [:new, :create, :index, :show]

  root 'home#index'
end


