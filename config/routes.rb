Rails.application.routes.draw do
 resources :posts
 resources :users
 root 'posts#index'
 get '/signup' => 'users#new'
 post '/signup' => 'users#create'
  post '/login', to: 'sessions#create', as: :logmein
  delete '/logout', to: 'sessions#destroy', as: :logout
end
