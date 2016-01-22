class AnswersController < ApplicationController
  def create 
     @user = User.find(params[:user_id])
     @post = Post.find(params[:post_id])
     @answer = @post.answers.new(answer_params)
     @answer.post_id
     if @answer.save
	    redirect_to root_path, notice: 'Answer successfully created'
     else 
	    render action 'new'
     end  
  end 

  def update 
  end 

  def destroy 
  end 

  def upvote
    @answer = Answer.find(params[:id])
    @answer.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.downvote_from current_user
    redirect_to :back
  end

  private 

  def set_comment
	  @answer = Answer.find(params[:id])
  end

  def answer_params
	  params.require(:answer).permit(:body)
  end 
end 
