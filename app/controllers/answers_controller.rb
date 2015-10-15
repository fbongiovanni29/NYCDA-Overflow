class AnswersController < ApplicationController

	def create
	end 

	def update
	end 

	def destroy
		#@answer.destroy
	end 

private 
	def set_answer 
		@answer = Comment.find(params[:id])
	end 

	def answer_params 
		params.require(:answer).permit(:link_id, :body, :user)
	end 
end
