Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :hikes do
    resources :requests, only: [:create]
  end
  resources :requests, only: [:index]

end
