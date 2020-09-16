Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do
    get :search, on: :collection
  end
  resources :groups do
    get :search, on: :collection
    get "members" => "group_members#index", as: :members
    resources :chats, only: [:create, :destroy]
  end
  resources :categories, only: [:index]
end
