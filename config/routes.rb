Rails.application.routes.draw do
  get 'dashboard/index'
  # resources :tasks
   resources :tasks, shallow: true

  resources :projects
  devise_for :users
  root "dashboard#index"
end
