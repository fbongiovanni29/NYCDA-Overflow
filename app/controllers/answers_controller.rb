class AnswersController < ApplicationController

	def create
		# @post = Post.find(params[:post_id])
		# @answer = post.answers.new(answer_params)
		# @answer.user = current_user
	end 

	def update
	end 

	def destroy
		#@answer.destroyu
	end 

private 
	def set_answer 
		@answer = Comment.find(params[:id])
	end 

	def answer_params 
		params.require(:answer).permit(:link_id, :body, :user)
	end 
end
