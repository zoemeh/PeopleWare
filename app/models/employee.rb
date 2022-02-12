class Employee < ApplicationRecord
  belongs_to :job
  belongs_to :candidate, dependent: :destroy
  validates :name, presence: true
  validates :cedula, presence: true, uniqueness: true
  validates :hired_date, presence: true
  validate :hired_date_cannot_be_in_the_past
  validates :wage, presence: true, numericality: {less_than_or_equal_to: proc { |r| r.job.wage_max }, message: proc { |r| "no puede superal el maximo del puesto: #{r.job.wage_max}"}}
  validates :candidate_id, uniqueness: true

  def hired_date_cannot_be_in_the_past
    if hired_date.present? && hired_date < Date.today
      errors.add(:hired_date, "no puede ser en el pasado")
    end 
  end
end
