Rails.application.routes.draw do
  root  'home#index'

  resources :records
  resources :exercises
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
   }
end
