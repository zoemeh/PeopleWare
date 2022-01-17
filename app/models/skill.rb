class Skill < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { 
    in: %w(active inactive), message: "'%{value}' is not a valid status"
  }
end
