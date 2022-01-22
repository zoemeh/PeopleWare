class Candidate < ApplicationRecord
  belongs_to :job
  has_many :trainings
  has_and_belongs_to_many :languages
  accepts_nested_attributes_for :trainings, reject_if: proc { |attributes| 
    attributes["description"].blank? || attributes["institution"].blank?
  }

  def has_language?(lang)
    language_ids.all?(lang.id)
  end
end
