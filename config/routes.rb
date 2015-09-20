Rails.application.routes.draw do
  get 'sessions/new'

  root 'users#new'
  get 'about'   => 'static_pages#about'

  resources :groceries
  resources :users
end
