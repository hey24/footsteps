Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: "pages#home"

  resources :hikes do
    resources :markers, only: [:index, :create] do
      collection do
        post :batch_create
      end
    end
    resources :requests, only: [:create]
  end
  resources :requests, only: [:index], path: 'my_hikes' do
    post "/accept", to: 'requests#accept'
    post "/reject", to: 'requests#reject'
  end
end
