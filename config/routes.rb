Rails.application.routes.draw do

  namespace :api do
      # get 'tweets/:id/:id', to: '/api/tweets#show'
      resources :tweets, path: :news, only: [:index, :show, :create, :destroy]
      # get '/api/tweets/*date', :controller => 'api/tweets', :action => 'index'
    end
  

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :admin do 
    resources :users do
      resources :tweets
    end
  end
  
  namespace :admin do 
    resources :users do
      resources :likes
    end
  end
  
  namespace :admin do 
    resources :users do
      resources :friends
    end
  end
  
  
  resources :tweets do
    resources :likes
  end
  
  
  get '/tweets/hashtag/:name', to:'tweets#hashtags'

  # resources :users do		
  #   member do		
  #     get :following, :followers		
  #   end		
  # end		


  # resources :users
  
  #, only: [:profile] do
  # get 'profile'
  #end 

  #get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
end
