Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :memberships
  resources :listings
  resources :lists
  resources :movies
  root 'pages#home'

  get 'pages/about'


end
