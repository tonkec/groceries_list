Rails.application.routes.draw do

  root 'users#new'

  resources :groceries
  get 'about'   => 'static_pages#about'

end
