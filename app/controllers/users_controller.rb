class UsersController < ApplicationController
  respond_to :html, :js

  def index
    @user = current_user
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:city, :state, :occupation, :bio, :image, :password))
      flash[:notice] = "profile was updated"
      respond_to do |format|
        format.html {redirect_to user_path(@user)}
        format.js
      end
    else
      render :show
    end
  end

  def show
    @user = User.find(params[:id])
    @user_skill = UserSkill.new
  end
end
