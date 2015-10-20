Rails.application.routes.draw do
  resources :users do
  	resources :posts
  end

  post '/users/:user_id/posts/:post_id' => 'answers#create'
  root 'posts#home_page'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/login', to: 'sessions#create', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout

end
