Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :index]

  get    'home'    => 'sessions#home'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'signup'  => 'users#new'

  resources :attendances, only: [:new, :create, :index, :show]

  get 'external_attendances', to: 'attendances#external_attendances', as:'external_attendances'
  resources :groups, only: [:new, :create, :index, :show] 

  root 'sessions#home'
end
