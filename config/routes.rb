Rails.application.routes.draw do
  # get 'roads/index'

  # post 'roads/create'


  resources :roads
  resources :map_locations

  root 'home#index'
end
