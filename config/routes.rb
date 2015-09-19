Rails.application.routes.draw do
  root 'users#new'
  get 'about'   => 'static_pages#about'

  resources :groceries
  resources :users
end
