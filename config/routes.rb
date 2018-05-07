Rails.application.routes.draw do
  resources :bookings
  resources :cars
  resources :reviews, as: 'reviews'
  resources :microposts, as: 'microposts'
  resources :users, as: 'users'

  root 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'

  resources :posts do
    resource :comments
  end
end
