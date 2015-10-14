class UsersController < ApplicationController
	
  def index
  end

  #sets user to new
  def new
  	@user = User.new
  end

  #posts new user to the database
  def create
  	@user = User.create(user_params)
	@user.password = params[:password]
	if @user.save
		flash[:notice] = "You signed up successfully"
		flash[:color] = "valid"
	else
		flash[:notice] = "Form is invalid"
		flash[:color] = "invalid"
	end
	render "new"
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
  def forgot_password
	@user = User.find_by_email(params[:email])
	random_password = Array.new(10).map { (65 + rand(58)).chr }.join
	@user.passwrd = random_password
	@user.save!
	Mailer.create_and_deliver_password_change(@user, random_password)
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
	  		:password,
			:password_confirmation
			)
  	end 
end
