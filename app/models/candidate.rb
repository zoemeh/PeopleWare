class Candidate < ApplicationRecord
  belongs_to :job
  has_many :trainings
  accepts_nested_attributes_for :trainings, reject_if: proc { |attributes| 
    attributes["description"].blank? || attributes["institution"].blank?
  }
end
