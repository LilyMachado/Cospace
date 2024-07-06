Rails.application.routes.draw do
  resources :users, only: [:create] do
    collection do
      post :sign_up
    end
  end

  resources :users, only: [:create] do
    collection do
      post :login
    end
  end

  resources :workspaces, except: [:new, :edit] do
    member do
      put :availability
    end
  end

  resources :bookings, except: [:new, :edit] do
    member do
      get :confirmation
      put :status
      post :notify
    end
    collection do
      get :notifications
    end
  end
end
