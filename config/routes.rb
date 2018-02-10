Rails.application.routes.draw do
  get 'signup', to: 'members#new'
  get 'login',  to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :members
  resources :guests
  resources :sessions, only: [:create]
  resources :tasks
  root to: 'tasks#index'
end
