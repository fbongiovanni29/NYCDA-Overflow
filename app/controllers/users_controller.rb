class UsersController < ApplicationController
	
  def index
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
	if @user.save
		flash[:notice] = "You signed up successfully"
		flash[:color] = "valid"
	else
		flash[:notice] = "Form is invalid"
		flash[:color] = "invalid"
	end
	render "new"
  end 

  def show
  end

  def edit
  end


  	def user_params 
	  	params.require(:user).permit(
	  		:firstname,
	  		:lastname,
	  		:email,
	  		:password,
			:password_confirmation
			)
  	end 
end
