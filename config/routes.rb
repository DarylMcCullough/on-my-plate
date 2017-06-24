Rails.application.routes.draw do

  resources :items, only: [:create, :destroy]

  get 'welcome/index'

  get 'welcome/about'

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users, only: [:show]

  root 'users#show'
end
