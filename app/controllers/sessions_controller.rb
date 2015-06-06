class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    flash[:notice] = "You are signed in"
    if Time.now.utc.to_i == @user.created_at.to_i
      redirect_to edit_user_path(@user)
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "signed out of fb"
    redirect_to root_path
  end
end
