class UsersController < ApplicationController
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
      flash[:notice] = "profile updated"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @user_skill = UserSkill.new
  end
end
