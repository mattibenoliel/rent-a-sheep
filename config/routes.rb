Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  get 'who', to: 'pages#who'
  resources :sheeps do
      resources :bookings, only: [:new, :create]
    end
end
