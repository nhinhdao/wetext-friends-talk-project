Rails.application.routes.draw do
  root 'sessions#welcome'
  get 'sessions/new'
  get 'sessions/create'
  get 'connections/index'
  get 'connections/new'
  get 'connections/create'
  get 'connections/update'
  get 'connections/destroy'
  get 'posts/index'
  get 'posts/new'
  get 'posts/create'
  get 'posts/update'
  get 'posts/destroy'
  get 'messages/index'
  get 'messages/new'
  get 'messages/create'
  get 'messages/update'
  get 'messages/destroy'
  get 'user/index'
  get 'user/new'
  get 'user/create'
  get 'user/update'
  get 'user/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
