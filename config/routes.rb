Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: "pages#home"

  resources :hikes do
    member do
      post "confirm", to: 'hikes#confirm'
      post "unconfirm", to: 'hikes#unconfirm'
    end
    resources :markers, only: [:index, :new, :create, :destroy], path: 'routes', as: :routes
    resources :requests, only: [:create]
    resources :chatrooms, only: :index do
      resources :messages, only: :create
    end
  end
  resources :requests, only: [:index], path: 'my_hikes' do
    post "/accept", to: 'requests#accept'
    post "/reject", to: 'requests#reject'
  end
  resources :chatrooms, only: :index do
    resources :messages, only: :create
  end
end
