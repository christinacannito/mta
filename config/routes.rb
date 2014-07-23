Rails.application.routes.draw do

  resources :contacts

  
  
  
  
  resources :recipients 

  


  # resources :user do
  #   resources :recipients
  # end

  # users/recipients/

  #resources :pins
  resources :alerts
  # devise_for :views
  # devise_for :installs

  devise_for :users


# resources :users do
#    resources :recipients
# end

  
  




  root "pages#home"
  get "about" => "pages#about"
  get "recipients" => "pages#recipients"

  get "alerts" => "recipients#alerts"
  get "go" => "alerts#go", as: 'go_alert'



end