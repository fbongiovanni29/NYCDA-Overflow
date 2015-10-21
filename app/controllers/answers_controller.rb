class AnswersController < ApplicationController
	
	# before_action :set_comment, only [:show, :edit, :update, :destroy]

	#all of my additions are currently commented out to avoid conflicts/errors
	#this can all perhaps be added to the answers controller. I will make a compatible controller out of it

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
		# if @answer.update(comment_params)
		# 	redirect_to @answer, notice: 'Answer was successfully updated'
		# else 
		# 	render :edit 
		# end 
	end 

	def destroy 
		# @answer.destroy
		#redirect_to, notice: 'Answer deleted'
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
