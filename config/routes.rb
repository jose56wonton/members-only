Rails.application.routes.draw do
  get 'sessions/new'
  get '/login',    to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'static_pages/home'


  root 'posts#index'
  resources :posts, only: [:new,:create,:index]
end
