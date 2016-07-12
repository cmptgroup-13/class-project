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
  get 'about', to: 'main#aboutus'
  get 'single', to: 'main#single'
  get 'locations', to: 'main#nearme'
  root 'main#index'
  resources :postsrake

  devise_for :users, controllers: { registrations: "registrations" }
  match 'users/:id' => 'main#destroy', :via => :delete, :as => :admin_destroy_user

  get 'change', to: 'registrations#change'



  get 'showmap' => 'map#index'

  post   'login'   => 'main#index'
  get 'home', to: 'main#index'
  get 'users/:id/baths' => 'users#baths', :as => :user_posts


  resources :baths do
    resources :reviews
  end

  get 'accept' => 'baths#edit'
  get 'request' => 'baths#requests'
  get 'baths/showsingle/:id' => 'baths#showsingle', :as => :view
  get 'reviews/new/:id' => 'reviews#new', :as => :gob
  # # get 'newreview', to: 'baths#newreview'
  # get 'showreview', to: 'baths#showreview'
  # get '/reviews/new/:id' => 'reviews#new', :as => :newreview

  # clean this file up by seeing which "get"'s can be replaced with their equavilant rake routes name

end
