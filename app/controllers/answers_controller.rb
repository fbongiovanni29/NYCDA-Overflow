class AnswersController < ApplicationController
	
	# before_action :set_comment, only [:show, :edit, :update, :destroy]

	#all of my additions are currently commented out to avoid conflicts/errors
	#this can all perhaps be added to the answers controller. I will make a compatible controller out of it

	def create 
		# @post = Post.find(params[:params_id])
		# @answers = @post.answers.new(answer_params)
		# @answer.user = current_user

		# if @answer.save
		# 	redirect_to @link, notice: 'Answer successfully created'
		# else 
		# 	render action 'new'
		# end  
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

private 

	def set_comment
		@answer = Answer.find(params[:id])
	end

	def comment_params
		params.require(:answer).permit(:post_id, :body, :user)
	end 
end 