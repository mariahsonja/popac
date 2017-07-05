Rails.application.routes.draw do
  #MARIAH
  root to: "profiles#show"
  
  resource :profile
  devise_for :admins
  devise_for :users
  
  
  get 'site/about'
  get 'site/contact'
  
  #MARIAH
  get '/about' => 'site#about'
  #MARIAH
  get '/contact' => 'site#contact'
  #MARIAH
  get '/Admin' => 'user#admin_login'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
