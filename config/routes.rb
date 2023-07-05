Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: 'about'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:new, :index, :show, :edit, :update]

end