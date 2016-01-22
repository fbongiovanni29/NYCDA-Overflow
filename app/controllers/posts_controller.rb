class PostsController < ApplicationController
  def home_page
    if !current_user
      @user = User.new
      render 'users/new'
    else 
      @posts = Post.all.order('created_at DESC')
      render 'posts/index'
    end
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end 

  def new 
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save 

    redirect_to root_path
  end 

  def show 
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @answers = Answer.where(post_id: params[:id]).order(:cached_votes_score => :desc)
  end 

  def edit
  end 

  def update 
    @user = User.find(params[:session_id])
    @answer.upvote_by @user
    @answer.save
  end 

  def destroy
  end  

 def upvote 
   @answer.upvote_by current_user
   redirect_to :back 
 end

  private 
  def post_params 
    params.require(:post).permit(:title, :body)
  end
end
