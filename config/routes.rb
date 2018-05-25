Rails.application.routes.draw do
  resources :categories
  resources :cities
  resources :bookings
  resources :reviews
  resources :items do
    collection do
      get :things
      get :beverages
    end
  end
  resources :users
  resources :bookings
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#index'
  get 'about' => 'pages#about', as: 'about'
end