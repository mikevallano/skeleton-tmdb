Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :memberships
  resources :lists
  delete '/listings/:list_id/:movie_id', to: 'listings#destroy', as: :delete_listing
  resources :listings, only: [:create]
  get 'my-movies', to: 'movies#my_movies', as: :my_movies #this will eventually go to movies#index
  resources :movies
  root 'pages#home'

  get 'pages/about'


end
