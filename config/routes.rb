AcChat::Application.routes.draw do
  get 'dashboard/index'

  root to: 'conversations#index'

  devise_for :users
  
  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
end
