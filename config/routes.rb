Rails.application.routes.draw do

  resources :invites
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :notes
  # resources :taggings
  get 'tags/:tag', to: 'movies#my_movies', as: :tag
  resources :tags, only:[:create]

  resources :memberships
  resources :lists
  delete '/listings/:list_id/:movie_id', to: 'listings#destroy', as: :delete_listing
  resources :listings, only: [:create]
  get 'my-movies', to: 'movies#my_movies', as: :my_movies #this will eventually go to movies#index
  resources :movies
  root 'pages#home'

  get 'pages/about'


end
