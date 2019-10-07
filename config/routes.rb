Rails.application.routes.draw do
  get    '/signup', to: 'users#new'
  post   '/signup', to: 'users#create'
  #get    '/user'  , to: 'users#show'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users,    only: [:new, :create, :show]
end
