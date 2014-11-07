Rails.application.routes.draw do
  resources :group_emails
  resources :emails
  get 'home/index'
  get 'dashboard/index'
  devise_for :users
  root 'dashboard#index'
  match ':controller(/:action(/:id))', :via => [:get, :post]
end
