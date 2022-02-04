class Employee < ApplicationRecord
  belongs_to :job
  belongs_to :candidate
  validates :name, presence: true
  validates :cedula, presence: true, uniqueness: true
  validates :hired_date, presence: true
  validates :wage, presence: true
end
