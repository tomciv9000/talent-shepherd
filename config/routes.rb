Rails.application.routes.draw do
  #root 'users#new'
  
  resources :users, only: [:new, :create, :show]
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
