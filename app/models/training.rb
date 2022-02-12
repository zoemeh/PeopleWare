class Training < ApplicationRecord
  belongs_to :candidate
  validates :description, presence: true
  validates :level, presence: true
  validate :date_has_to_match


  def date_has_to_match
    if from_at > to_at
      errors.add(:from_at, "La fecha desde debe ser menor que la fecha hasta")
    end 
  end
end
