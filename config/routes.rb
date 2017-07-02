Rails.application.routes.draw do
  get 'sessions/new'
  get '/login',    to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'static_pages/home'

  resources :users
  root 'static_pages#home'
end
