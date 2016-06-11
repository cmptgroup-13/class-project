Rails.application.routes.draw do


  root to: 'sessions#new'
  get 'home', to: 'users#index'
  get 'profile', to: 'users#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end



  
  
