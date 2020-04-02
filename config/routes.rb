Rails.application.routes.draw do
  resources :details
  resources :sizes
  resources :pieces

  root to: 'pieces#index'
  get '/home/about'
end
