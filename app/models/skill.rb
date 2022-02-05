class Skill < ApplicationRecord
  validates :description, presence: true
  
  def self.active
    Skill.where(status: true)
  end
end
