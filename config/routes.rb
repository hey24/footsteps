Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: "pages#home"

  resources :hikes do
    member do
      post "confirm", to: 'hikes#confirm'
      post "unconfirm", to: 'hikes#unconfirm'
    end
    resources :requests, only: [:create]
  end
  resources :requests, only: [:index], path: 'my_hikes' do
    post "/accept", to: 'requests#accept'
    post "/reject", to: 'requests#reject'
  end
end
