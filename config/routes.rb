Rails.application.routes.draw do
  root 'sessions#welcome'

  resources :users, shallow: true do
    resources :posts
    resources :messages
  end

  resources :connections, only: [:create, :destroy]
  resources :posts
  resources :messages

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get '/auth/facebook/callback' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  post '/users/:id' => 'users#update'
  get 'users/:id/friends' => 'users#friends', as: 'friends'
  get '/users/:id/messages/:fid' => 'messages#all_messages'
  get '*unmatched_route', to: 'messages#notfound'
end
