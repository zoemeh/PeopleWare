class Training < ApplicationRecord
  belongs_to :candidate
  validates :description, presence: true
  validates :level, presence: true
end
