# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pieces#index'
  get 'pages/home'
  devise_for :users

  resources :details
  resources :sizes
  resources :pieces

  get '/home/about'
  post 'pieces/add_to_cart/:id', to: 'pieces#add_to_cart', as: 'add_to_cart'
  delete 'pieces/remove_from_cart/:id', to: 'pieces#remove_from_cart', as: 'remove_from_cart'
end
