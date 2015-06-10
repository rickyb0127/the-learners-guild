class UserSkillsController < ApplicationController
  def create
    @user = current_user
    skill = Skill.find_by(name: params["user_skill"]["skill_name"])
    if skill
      @user_skill = UserSkill.new(params.require(:user_skill).permit(:user_id, :skill_id, :learned).merge(user_id: @user.id, skill_id: skill.id))
    else
      skill = Skill.create!(name: params["user_skill"]["skill_name"])
      @user_skill = UserSkill.new(params.require(:user_skill).permit(:user_id, :skill_id, :learned).merge(user_id: @user.id, skill_id: skill.id))
    end
    if @user_skill.save
      flash[:notice] = "skill was successfully added"
      redirect_to user_path(@user)
    else
      flash[:notice] = "You have already selected this skill"
      redirect_to user_path(current_user)
    end
  end
end
