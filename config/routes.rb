Rails.application.routes.draw do
  root 'sessions#welcome'

  resources :users, shallow: true do
    resources :posts
    resources :messages
  end

  resources :connections

  #
  # get 'login'
  # post 'login'
  # get 'signup'
  # post 'signup'
  get '/auth/facebook/callback' => 'sessions#create'
  # get 'logout'
  # post 'logout'
  # get 'posts/new'
  # get 'posts/destroy'
  # get 'messages/new'
  # get 'users/new' => 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
