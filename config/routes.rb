Rails.application.routes.draw do
  get 'favours/new'

  get 'sessions/new'

  get 'test/testing'

  get 'users/new'

  root 'static_pages#home'
  get     '/help',      to: 'static_pages#help'
  get     '/about',     to: 'static_pages#about'
  get     '/contact',   to: 'static_pages#contact'
  get     '/signup',    to: 'users#new'
  post    '/signup',    to: 'users#create'
  post     '/store_location/:id/',     to: 'users#store_user_location'
  get     '/login',     to: 'sessions#new'
  post    '/login',     to: 'sessions#create'
  delete  '/logout',    to: 'sessions#destroy'
  get     '/favours',   to: 'favours#index'
  get     '/inbox',     to: 'conversations#inbox'
  get     '/test/:id/',      to: 'users#test'
  get     '/nearby',      to: 'favours#nearby'
  resources :users
  resources :favours
  resources :conversations do
    resources :messages
  end
  resources :forgot_passwords, only: [:new, :create, :edit, :update]
  resources :comments,          only: [:create, :destroy]
end