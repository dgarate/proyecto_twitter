Rails.application.routes.draw do
  
  resources :tweets do
    resources :likes
  end
  
  resources :users, only: [:profile] do
    get 'profile'
  end 

  #get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
end
