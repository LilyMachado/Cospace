Rails.application.routes.draw do
  resources :workspaces, controller: 'workspace' do
    member do
      get 'availability', to: 'workspace#edit_availability'
      patch 'availability', to: 'workspace#update_availability'
    end
    resources :reviews, only: [:index, :new, :create]
  end
  resources :bookings
  resources :users, only: [:new, :create, :index, :show]

  root 'workspace#index'
end
