class SessionsController < ApplicationController
  def create
    @user = if params[:email] then
      User.find_by(email: params[:email])
    else
      User.find(params[:id])
    end
    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path @user
    else
      flash[:notice] = "Something went wrong"
      redirect_to root_path
    end
  end

  def destroy
    puts "DESTROYED"
    session[:user_id] = nil
    redirect_to root_path
  end
end
