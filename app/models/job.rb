class Job < ApplicationRecord
  validates :name, presence: true
  validates :department_id, presence: true
  validates :risk_level, presence: true, inclusion: {in: %w{low medium high}, message: I18n.t("%{value} is not a valid risk level")}
  validates :wage_min, presence: true, numericality: true
  validates :wage_max, presence: true, numericality: {greater_than: proc { |r| r.wage_min }, message: I18n.t("should be greater than min wage")}
  has_many :candidates, dependent: :destroy
  belongs_to :candidate, optional: true, dependent: :destroy
  belongs_to :department
  validate :cant_enable_if_no_candidate

  def select_candidate(candidate, wage, hired_date)
    employee = Employee.create(cedula: candidate.cedula, name: candidate.name, hired_date: hired_date,
      job: self, wage: wage, status: true, candidate: candidate)
    if !employee.id.nil?
      self.candidate = candidate
      self.status = false
      self.save
    end
    employee
  end

  def has_employee?
    !self.candidate.nil?
  end

  def cant_enable_if_no_candidate
    if has_employee? && self.status == true
      errors.add(:status, "no puede activar el puesto si ya tiene un candidato seleccionado")
    end 
  end
end
