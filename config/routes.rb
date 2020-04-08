# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
  resources :details
  resources :sizes
  resources :pieces

  root to: 'pieces#index'
  get '/home/about'
  post 'pieces/add_to_cart/:id', to: 'pieces#add_to_cart', as: 'add_to_cart'
  delete 'pieces/remove_from_cart/:id', to: 'pieces#remove_from_cart', as: 'remove_from_cart'
end
