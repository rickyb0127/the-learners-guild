class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  validates :skill_id, uniqueness: { scope: :user_id }

  def skill_name
    skill.try(:name)
  end

  def skill_name=(name)
    self.skill = Skill.find_or_create_by(name) if name.present?
  end
end
