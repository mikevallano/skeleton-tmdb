Rails.application.routes.draw do

  resources :lists
  devise_for :users
  resources :movies
  root 'pages#home'

  get 'pages/about'


end
