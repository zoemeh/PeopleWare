class Candidate < ApplicationRecord
  belongs_to :job
  has_one :employee
  has_many :trainings
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :skills
  accepts_nested_attributes_for :trainings, reject_if: proc { |attributes| 
    attributes["description"].blank? || attributes["institution"].blank?
  }

  validates :name, presence: true
  validates :cedula, presence: true, uniqueness: true
  validates :desired_wage, presence: true, numericality: true

  def has_language?(lang)
    language_ids.all?(lang.id)
  end
end
