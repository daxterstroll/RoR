Rails.application.routes.draw do
  resources :category_fields
  resources :categories
  resources :cities
  resources :bookings
  resources :reviews
  resources :items
  resources :users
  resources :bookings
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#index'
  get 'about' => 'pages#about', as: 'about'
end