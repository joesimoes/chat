Rails.application.routes.draw do
  resources :comments, only: [:new, :create, :index]
  resources :users
  resources :sessions


  root to: "comments#index"
end
