Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/new'

  get 'users/show'

  get 'users/index'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  root  'sessions#new'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'home', to: 'users#index'
  get 'profile', to: 'users#show'
  resources :users
end
