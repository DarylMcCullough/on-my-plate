Rails.application.routes.draw do
  get 'users/show'

  get 'welcome/index'

  get 'welcome/about'

  devise_for :users, :controllers => {:registrations => "registrations"}
  
  root 'users#show'
end
