Rails.application.routes.draw do
  get 'custom_error/index'

  resources :contacts

  mount Ckeditor::Engine => '/ckeditor'
  resources :group_emails
  resources :emails
  resources :dashboard
  get 'home/index'
  get 'dashboard/index'
  devise_for :users
  root 'dashboard#index'
  match ':controller(/:action(/:id))', :via => [:get, :post]
end
