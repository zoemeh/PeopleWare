class Language < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :status, presence: true, inclusion: { 
    in: %w(active inactive), message: "'%{value}' is not a valid status"
  }
end
