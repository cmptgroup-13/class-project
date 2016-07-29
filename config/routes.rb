Rails.application.routes.draw do


  get 'news/index'

  get 'baths/new'

  get 'baths/create'

  get 'baths/index'

  get 'baths/show'
  
  get 'news' => 'news#index'

  get 'main/index'
  get 'newbath' => 'baths#index'
  get 'createbath' => 'baths#new'
  get 'showbath' => 'baths#show'
  get 'main/show'
  get 'profile', to: 'main#show'
  get 'about', to: 'main#aboutus'
  get 'locations', to: 'main#nearme'
  get 'practice', to: 'main#practice'
  root 'main#index'
  resources :postsrake

  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: 'omniauth_callbacks' }
  match 'users/:id' => 'main#destroy', :via => :delete, :as => :admin_destroy_user
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
 

  get 'change', to: 'registrations#change'



  get 'showmap' => 'map#index'

  post   'login'   => 'main#index'
  get 'home', to: 'main#index'
  get 'users/:id/baths' => 'users#baths', :as => :user_posts


  resources :baths do
    # delete 'baths/showsingle/:id' => 'baths#showsingle', :via => :get
    resources :reviews
    get 'reviews/:id' => 'reviews#destroy', :via => :delete, :as => :review_destroy
    

  end
  
  resources :reviews do
    resources :flags
  end
  

  get 'report' => 'reviews#reported'
  get 'accept' => 'baths#edit'
  get 'request' => 'baths#requests'
  # get 'review_destroy' => 'reviews#delete'
  get 'baths/showsingle/:id' => 'baths#showsingle', :as => :view
  get 'main/directions/:id' => 'main#directions', :as => :direction
  
 



  # clean this file up by seeing which "get"'s can be replaced with their equavilant rake routes name

end
