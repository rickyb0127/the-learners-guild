class RegistrationsController < ApplicationController
  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password))
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for signing up"
      redirect_to edit_user_path(@user)
    else
      flash[:notice] = "Something went wrong"
      render 'welcome/index'
    end
  end
end
