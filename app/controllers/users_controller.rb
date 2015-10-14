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
  	@user.update(user_params)
  	redirect_to @user
  end

  def destroy 
  	@user.destroy
  	redirect_to root_path
  end 

  private 

    def set_user

      begin 
        @user = User.find(params[:id])
      rescue
        redirect_to root_path
      end 
    end

  	def user_params 
	  	params.require(:user).permit(
	  		:firstname,
	  		:lastname,
	  		:email,
	  		:password_digest)
  	end 
end
