Rails.application.routes.draw do
  resources :map_locations

  root 'home#index'
end
