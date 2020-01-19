Rails.application.routes.draw do
  
  
  
  devise_for :users
  root to: 'static#home'

  resources :actors do
    resources :appointments
  end
  
  resources :agencies, only: [:index, :new, :create, :show, :edit] do
    resources :users
  end

  resources :projects do
    resources :appointments
  end
  
  resources :casting_offices
  resources :bookings
  resources :users
  resources :appointments, only: [:index, :new, :create, :show, :edit]
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'


end
