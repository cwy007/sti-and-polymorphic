Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  get 'login',  to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:create] 
  resources :sessions, only: [:create]
  root to: 'welcome#index'
end
