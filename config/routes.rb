Rails.application.routes.draw do

  resources :groceries
  get 'about'   => 'static_pages#about'

  root 'static_pages#home' 
end
