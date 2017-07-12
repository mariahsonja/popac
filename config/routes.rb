Rails.application.routes.draw do
  resources :interests
  #MARIAH
  root to: "profiles#show"
  
  resource :profile
  
  get :search, to: 'search#index'
  
  devise_for :admins
  devise_for :users
  
  
  #MARIAH
  get '/about' => 'site#about'
  #MARIAH
  get '/contact' => 'site#contact'
  #MARIAH
  get '/Admin' => 'user#admin_login'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
