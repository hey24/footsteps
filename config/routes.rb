Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: "pages#home"

  resources :hikes do
    resources :markers, only: [:index, :new, :create, :destroy], path: 'routes', as: :routes
    resources :requests, only: [:create]
    resources :chatrooms, only: :show
  end
  resources :requests, only: [:index], path: 'my_hikes' do
    post "/accept", to: 'requests#accept'
    post "/reject", to: 'requests#reject'
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
