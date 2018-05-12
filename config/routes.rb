Rails.application.routes.draw do
  resources :cities
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :bookings
  resources :reviews
  resources :items
  resources :users
  resources :booking
  root 'users#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'
end
