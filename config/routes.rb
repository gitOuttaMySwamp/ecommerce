# frozen_string_literal: true

Rails.application.routes.draw do
  resources :product_orders
  resources :sales_taxes
  resources :provinces
  root to: 'pieces#index'

  scope '/checkout' do
    get 'invoice', to: 'checkout#invoice', as: 'checkout_invoice'
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  devise_for :users

  resources :orders
  resources :details
  resources :sizes
  resources :pieces

  # get '/home/about'
  post 'pieces/add_to_cart/:id', to: 'pieces#add_to_cart', as: 'add_to_cart'
  delete 'pieces/remove_from_cart/:id', to: 'pieces#remove_from_cart', as: 'remove_from_cart'
end
