Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  resources :products
  resources :warehouses
  resources :customers
  resources :orders
  resources :purchases, only: %i[new create show] do
    resources :list_purchases, only: %i[new create]
  end
  # resources :list_purchases, only: %i[create]
  get '/kpis', to: 'pages#kpis'

end
