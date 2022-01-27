class CreateCandidatesSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates_skills, id: false do |t|
      t.belongs_to :candidate
      t.belongs_to :skill
    end
  end
end
