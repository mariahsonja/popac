Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  # MARIAH
  root to: "site#home"

  resources :interests
  resource :profile

  get :search, to: 'search#index'
end
