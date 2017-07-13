Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  
  # MARIAH
  root to: "profiles#show"
  
  resources :interests
  resource :profile
  
  get :search, to: 'search#index'

  #MARIAH
  get '/about', to: 'site#about'
  get '/contact', to: 'site#contact'
end
