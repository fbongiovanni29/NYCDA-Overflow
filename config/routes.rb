Rails.application.routes.draw do

  #roots to the logged in home page
  root 'posts#index'

  #creates the answer
  post '/users/:user_id/posts/:post_id' => 'answers#create'

  #sessions login/out
  resources :sessions, only: [:create, :destroy]
  
  #routes for users
  resources :users, only: [:show, :new, :create, :edit] do
    #nested routes for posts
    resources :posts, only: [:index, :new, :show, :create]
  end

  #nests the votes
  resources :answers, only: [] do
    member do
      put "like", to: "answers#upvote"
      put "dislike", to: "answers#downvote"
    end
  end
end
