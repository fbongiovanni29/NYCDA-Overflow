class CommentsController < ApplicationController
	
	# before_action :set_comment, only [:show, :edit, :update, :destroy]

	#all of my additions are currently commented out to avoid conflicts/errors
	#this can all perhaps be added to the answers controller. I will make a compatible controller out of it

	def create 
		# @post = Post.find(params[:params_id])
		# @comment = @post.comments.new(comment_params)
		# @comment.user = current_user

		# if @comment.save
		# 	redirect_to @link, notice: 'Comment successfully created'
		# else 
		# 	render action 'new'
		# end  
	end 

	def update 
		# if @comment.update(comment_params)
		# 	redirect_to @comment, notice: 'Comment was successfully updated'
		# else 
		# 	render :edit 
		# end 
	end 

	def destroy 
		# @comment.destroy
		#redirect_to, notice: 'Comment deleted'
	end 

private 

	def set_comment
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:post_id, :body, :user)
	end 
end 