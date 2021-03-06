# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, path: '/auth', controllers: { sessions: 'auth/sessions' }, defaults: { format: :json }
  devise_scope :user do
    get '/auth/check_in', to: 'auth/sessions#check_in', defaults: { format: :json }
  end
  match '/calcs/cost', to: 'calcs#cost', via: [:get, :post]
  resources :rentals
  resources :rent_values, only: [:index]
  resources :formats
  resources :slice_rates
  resources :days_slices
  resources :order_addons
  resources :orders
  resources :pay_types
  resources :users
  resources :clients
  resources :spots
  resources :driver_licenses
  resources :passports
  resources :settlements
  resources :districts
  resources :addresses
  resources :additions
  resources :vehicles
  resources :model_classes
  resources :range_rates
  resources :days_ranges
  resources :rental_types
  resources :rental_classes
  resources :manufactures
  resources :models
  resources :body_types
  resources :bodies
  resources :trunks
  resources :trunk_types
  resources :localities
  resources :statuses
  resources :cities
  resources :regions
  resources :states
  resources :countries
  resources :manufacturers
  resources :brands
  resources :info_models

  post '/requests', to: 'requests#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
