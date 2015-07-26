Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  post 'users/add', to: 'users#add', as: 'user_add'
end
