Rails.application.routes.draw do

  get 'users/new'

  resources :groceries
  get 'about'   => 'static_pages#about'

  root 'static_pages#home' 
end
