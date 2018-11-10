Rails.application.routes.draw do
  root 'sessions#welcome'

  resources :users, shallow: true do
    resources :posts
    resources :messages
  end

  resources :connections

  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'signup' => 'users/new'
  post 'signup' => 'users/create'
  get '/auth/facebook/callback' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
end
