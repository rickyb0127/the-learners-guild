class SkillsToLearnController < ApplicationController
  def show
    @user = current_user
    @matched_users = User.where.not(id: @user.id).all && User.where(state: @user.state).all
    @skill = Skill.find(params[:id])
    @matched_skills = UserSkill.where(skill_id: @skill.id, learned: true)
  end
end
