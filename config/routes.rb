Rails.application.routes.draw do

  resources :contacts

  #resources :pins

  # devise_for :views
  # devise_for :installs
  devise_for :users, :path => "accounts"

resources :users do
   resources :recipients
end
  
  



  root "pages#legal"
  get "about" => "pages#about"
  get "legal" => "pages#legal"
  get "recipients" => "pages#recipients"
   

  

end
