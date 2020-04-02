Rails.application.routes.draw do
  resources :details
  resources :sizes
  resources :pieces
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
