Rails.application.routes.draw do
  resources :followers, except: [:edit, :update]
  resources :tweets, except: [:edit, :update]

  devise_for :users

  root to: 'homes#index'
end
