class Candidate < ApplicationRecord
  include SearchCop
  belongs_to :job
  belongs_to :user
  has_one :employee, dependent: :destroy
  has_many :trainings, dependent: :destroy
  has_one :department, :through => :job
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :skills
  accepts_nested_attributes_for :trainings, reject_if: proc { |attributes| 
    attributes["description"].blank? || attributes["institution"].blank?
  }

  search_scope :search do
    attributes :name, :cedula
    attributes job: "job.name"
    attributes puesto: "job.name"
    attributes nombre: "name"
    attributes cedula: "cedula"
    attributes salario: "desired_wage"
    attributes skill: ["skills.description"]
    attributes departamento: ["department.name"]
    attributes competencia: ["skills.description"]
    attributes idioma: ["languages.name"]
  end

  validates :name, presence: true
  validates :cedula, presence: true, uniqueness: true
  validates :desired_wage, presence: true, numericality: {greater_than: 0}
  validates_associated :trainings
  validate :cedula_valida
  before_validation :create_user
  after_destroy :clean_job

  def has_language?(lang)
    language_ids.all?(lang.id)
  end

  def create_user
    if self.id.nil? && self.user.nil?
      u = User.create(email: "#{self.cedula}@#{self.cedula}.com", password: self.cedula, group: "candidates")
      self.user = u
    end
  end

  def clean_job
    Job.where(candidate_id: self.id).each do |x|
      x.candidate_id = nil
      x.save
    end
  end

  def cedula_valida
    vnTotal = 0
    vcCedula = self.cedula.gsub("-","")
    pLongCed = vcCedula.strip.length
    digitoMult = [1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1]
    if (pLongCed < 11 || pLongCed > 11)   
      errors.add(:cedula, "No es valida")
      return
    end
    for vDig in 1..pLongCed do
      vCalculo = vcCedula[vDig-1,1].to_i * digitoMult[vDig-1]
      if (vCalculo < 10)
        vnTotal += vCalculo
      else
        vnTotal += vCalculo.to_s()[0,1].to_i + vCalculo.to_s()[1,1].to_i
      end
    end
    if not (vnTotal % 10 == 0)
      errors.add(:cedula, "No es valida")
    end
  end
end
