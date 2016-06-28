Rails.application.routes.draw do
  get 'main/index'

  get 'main/show'
  get 'profile', to: 'main#show'
  root 'main#index'
  resources :posts
  resources :postsrake
  devise_for :users, controllers: { registrations: "registrations" }
  get 'showmap' => 'map#bigpicture'
  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'

  # get 'users/new'

  # get 'users/show'

  # get 'users/index'

  # get 'users/create'

  # get 'users/edit'

  # get 'users/update'

  # get 'users/destroy'

  
  # get 'signup'  => 'users#new'
  # get    'login'   => 'sessions#new'
   post   'login'   => 'main#index'
  # delete 'logout'  => 'sessions#destroy'
  get 'home', to: 'main#index'
  # get 'profile', to: 'users#show'
  # resources :users

  
end
