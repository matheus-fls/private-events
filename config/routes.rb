Rails.application.routes.draw do
  get    '/signup', to: 'users#new'
  post   '/signup', to: 'users#create'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get    '/events', to: 'events#new'
  post   '/events', to: 'events#create'

  resources :events,   only: [:new, :create, :show, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users,    only: [:new, :create, :show]
end
