class Candidate < ApplicationRecord
  include SearchCop
  belongs_to :job
  belongs_to :user
  has_one :employee, dependent: :destroy
  has_many :trainings, dependent: :destroy
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :skills
  accepts_nested_attributes_for :trainings, reject_if: proc { |attributes| 
    attributes["description"].blank? || attributes["institution"].blank?
  }

  search_scope :search do
    attributes :name, :cedula
    attributes job: "job.name"
    attributes skill: ["skills.description"]
  end

  validates :name, presence: true
  validates :cedula, presence: true, uniqueness: true
  validates :desired_wage, presence: true, numericality: true

  before_validation :create_user

  def has_language?(lang)
    language_ids.all?(lang.id)
  end

  def create_user
    if self.id.nil? && self.user.nil?
      u = User.create(email: "#{self.cedula}@test.com", password: self.cedula, group: "candidates")
      self.user = u
    end
  end
end
