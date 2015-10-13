Rails.application.routes.draw do
 resources :posts
 root 'posts#index'
 get '/signup' => 'users#new'
 post '/signup' => 'users#create'
end
