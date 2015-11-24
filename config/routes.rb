Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :memberships
  resources :listings
  resources :lists
  get 'my-movies', to: 'movies#my_movies' #this will eventually go to movies#index
  resources :movies
  root 'pages#home'

  get 'pages/about'


end
