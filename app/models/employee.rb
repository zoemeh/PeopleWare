class Employee < ApplicationRecord
  belongs_to :job
  belongs_to :candidate
  validates :name, presence: true
  validates :cedula, presence: true, uniqueness: true
  validates :hired_date, presence: true
  validates :wage, presence: true, numericality: {less_than_or_equal_to: proc { |r| r.job.wage_max }, message: "no puede superal el maximo del puesto"}
  validates :candidate_id, uniqueness: true
end
