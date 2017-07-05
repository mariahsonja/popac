Rails.application.routes.draw do
  resources :profiles
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
  get '/logout' => 'user#logout'
  #MARIAH
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
