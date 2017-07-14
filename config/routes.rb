Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  # MARIAH
  root to: "site#home"

  resources :interests
  resources :profiles
end
