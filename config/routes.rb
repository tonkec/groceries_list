Rails.application.routes.draw do
  root 'users#new'
  get 'about'   => 'static_pages#about'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'

  resources :groceries
  resources :users
end
