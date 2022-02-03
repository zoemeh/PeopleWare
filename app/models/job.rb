class Job < ApplicationRecord
  validates :name, presence: true
  validates :department, presence: true
  validates :risk_level, presence: true, inclusion: {in: %w{low medium high}, message: I18n.t("%{value} is not a valid risk level")}
  validates :wage_min, presence: true, numericality: true
  validates :wage_max, presence: true, numericality: {greater_than: proc { |r| r.wage_min }, message: I18n.t("should be greater than min wage")}
  validates :status, presence: true

  has_many :candidates
  belongs_to :candidate
end
