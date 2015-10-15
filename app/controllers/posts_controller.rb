class PostsController < ApplicationController

	def home_page
		if !current_user
			render 'users/new'
		else 
			@posts = Post.all.order('created_at DESC')
		end
	end

	def index
		@posts = Post.all.order('created_at DESC')
	end 

	def new 
		#@post = current_user.posts.build
	end

	def create
		@post = Post.new(post_params)
		@post.save 

		redirect_to @post
	end 

	def show 
		@post = Post.find(params[:id])
	end 

	def edit
	end 

	def update 
	end 

	def destroy
		# @post.destroy #this should work for the destroy action
 	end  



#below are the up/downvote methods. 
#I'm prepping them and leaving them uncommented until I get all of the 
#votable/users compatiblity stuf straightened out

  #   def upvote 
	 #    @link = Link.find(params[:id])
	 #    @link.upvote_by current_user
	 #    redirect_to :back 
  # 	end

  # def downvote
	 #    @link = Link.find(params[:id])
	 #    @link.downvote_by current_user
	 #    redirect_to :back 
  # end 

	private 
	def post_params 
		params.require(:post).permit(:title, :body)
	end
end
