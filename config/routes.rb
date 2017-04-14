Rails.application.routes.draw do
  get 'profiles/show'

  resources :followers, except: [:edit, :update]
  resources :tweets, except: [:edit, :update]

  devise_for :users

  get  'profile/show/:id', to: 'profiles#show', constraint: { id: /[0-9]{1,11}/ }

  root to: 'homes#index'
end
