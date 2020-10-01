Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tweets do
    resources :likes
  end
  

  resources :users do		
    member do		
      get :following, :followers		
    end		
  end		


  # resources :users
  
  #, only: [:profile] do
  # get 'profile'
  #end 

  #get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
end
