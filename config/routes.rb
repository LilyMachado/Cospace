Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new, :create] # Including all necessary actions for users
  resources :products

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'products#index'
end
