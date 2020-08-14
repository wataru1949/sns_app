Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  namespace :groups do
    resources :searches, only: :index
  end
  resources :groups, exept: :index do
    resources :chats, only: [:create, :destroy]
  end
  resources :categories, only: [:index]
end
