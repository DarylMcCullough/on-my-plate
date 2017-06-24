Rails.application.routes.draw do
  resources :users, only: [:show]
  resources :items, only: [:create, :destroy]

  get 'welcome/index'

  get 'welcome/about'

  devise_for :users, :controllers => {:registrations => "registrations"}

  root 'users#show'
end
