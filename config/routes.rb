Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/welcome', to: 'users#welcome'

end
