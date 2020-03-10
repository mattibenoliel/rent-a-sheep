Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD
  get 'dashboard' , to: 'pages#dashboard'
=======
  get 'dashboard', to: 'pages#dashboard'
>>>>>>> 620cb5cd76b73fcd6be63d5b4f3915006ba121da
  resources :sheeps
end
