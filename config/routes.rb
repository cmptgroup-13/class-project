Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'baths/new'

  get 'baths/create'

  get 'baths/index'

  get 'baths/show'

  get 'main/index'
  get 'newbath' => 'baths#index'
  get 'createbath' => 'baths#new'
  get 'showbath' => 'baths#show'
  get 'main/show'
  get 'profile', to: 'main#show'
  root 'main#index'
  resources :posts
  resources :postsrake
  resources :baths
  devise_for :users, controllers: { registrations: "registrations" }
  match 'users/:id' => 'main#destroy', :via => :delete, :as => :admin_destroy_user


  get 'showmap' => 'map#index'
  
   post   'login'   => 'main#index'
  get 'home', to: 'main#index'

  
end
