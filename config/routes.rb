Rails.application.routes.draw do
  get 'roads/index'

  get 'roads/create'

  resources :map_locations

  root 'home#index'
end
