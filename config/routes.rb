Rails.application.routes.draw do
 resources :posts
 resources :users
 root 'posts#index'
 get '/signup' => 'users#new'
 post '/signup' => 'users#create'
end
