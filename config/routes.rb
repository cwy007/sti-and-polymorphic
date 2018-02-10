Rails.application.routes.draw do
  get 'signup', to: 'member_profiles#new'
  get 'login',  to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :member_profiles
  resources :guest_profiles
  resources :sessions, only: [:create]
  resources :tasks
  root to: 'tasks#index'
end
