Rails.application.routes.draw do
 resources :posts
 resources :users
 root 'posts#home_page'
 get '/signup' => 'users#new'
 post '/signup' => 'users#create'
  post '/login', to: 'sessions#create', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout
end
