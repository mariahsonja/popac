Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  devise_for :admins
  devise_for :users

  # MARIAH
  root to: "site#home"

  resources :interests
  resources :profiles do
    resources :conversations, except: [:edit, :update, :destroy] do
      post :send_message, on: :member
    end
  end
end
