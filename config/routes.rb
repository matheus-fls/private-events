# frozen_string_literal: true

Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/events', to: 'events#new'
  post '/events', to: 'events#create'
  root 'events#index'

  get '/attendance', to: 'attendance#new'
  post '/attendance', to: 'attendance#create'

  resources :attendance, only: %i[new create]
  resources :events, only: %i[new create show index]
  resources :sessions, only: %i[new create destroy]
  resources :users, only: %i[new create show]
end
