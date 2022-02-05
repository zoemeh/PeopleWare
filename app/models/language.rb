class Language < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  def self.active
    Language.where(status: true)
  end
end
