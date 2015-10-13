class UsersController < ApplicationController
	
  def index
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	redirect_to @user
  end 

  def show
  end

  def edit
  end

  private 

  	def user_params 
	  	params.require(:user).permit(
	  		:firstname,
	  		:lastname,
	  		:email,
	  		:password_digest)
  	end 
end
