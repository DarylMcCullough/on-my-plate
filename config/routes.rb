Rails.application.routes.draw do

  resources :items, only: [:create, :destroy]

  get 'welcome/index'

  get 'welcome/about'
  
  post 'welcome/my_action'

  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"}
  resources :users, only: [:show]
  
  root 'users#show'
end
