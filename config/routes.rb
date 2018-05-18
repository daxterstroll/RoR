Rails.application.routes.draw do
  resources :cities
  resources :bookings
  resources :reviews
  resources :items
  resources :users
  resources :booking
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#index', as: 'home'
  get 'about' => 'pages#about', as: 'about'
end
