class UsersController < ApplicationController

  def index
  end

  #sets user to new
  def new
  	@user = User.new
  end

  #posts new user to the database
def create
	@user = User.new(user_params)
	if @user.save
	#When sessions are correct uncomment
		flash[:notice] = "Please sign in to complete your registration!"
		redirect_to @user
	else
		flash[:notice] = "Form is invalid"
		flash[:color] = "invalid"
		render "new"
	end	
end 

  #uses bcrypt to find email and match it to password
def login
	@user = User.find_by_email(params[:email])
	if @user.password == params[:password]
		give_token
	else
		flash[:notice] = "Incorrect email/password combination"
		redirect_to login_path
	end
end

  #assigns random password and mails it to them
  #Hoping to get to later
 # def forgot_password
 #  @user = User.find_by_email(params[:email])
 #  random_password = Array.new(10).map { (65 + rand(58)).chr }.join
 #  @user.passwrd = random_password
 #  @user.save!
 #  Mailer.create_and_deliver_password_change(@user, random_password)
 # end

 #shows the user with the id with the param users/:id 
 def show
   @user = User.find(params[:id])
   @posts = @user.questions
 end

 #GETS the User params for the edit action
 def edit
   @user = User.find(params[:id])
 end

 #PATCH/PUT User params for the update action
 def update
  puts "UPDATING"
   @user = User.find(params[:id])
   if @user.update_attributes(user_params)
     flash[:success] = "Profile updated"
   end
   redirect_to user_path
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
#defines what paramaters are allowed to pass through user (as described by name)
 def user_params 
  params.require(:user).permit(
   :firstname,
   :lastname,
   :email,
   :password,
   :password_confirmation,
   :avatar
   )
 end 
end
