Rails.application.routes.draw do
  root "pages#home"

  resources :recipients 

  resources :contacts

  resources :alerts

  devise_for :users

end
