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
    resources :members, only: [:index, :create, :update, :destroy], controller:"group_members" do
      patch :reject, on: :member
      post :create, on: :member
    end
    resource :member, only: :destroy, controller:"group_members", as: :member_cancel
    resources :chats, only: [:create, :destroy]
  end
  resources :categories, only: [:index]
end
