class AuthenticationController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for signing in"
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are signed out"
    redirect_to root_path
  end
end
