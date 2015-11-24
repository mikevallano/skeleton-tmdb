Rails.application.routes.draw do

  resources :memberships
  resources :listings
  resources :lists
  devise_for :users
  resources :movies
  root 'pages#home'

  get 'pages/about'


end
