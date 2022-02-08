class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :cedula
      t.string :name
      t.references :job, null: false, foreign_key: true
      t.float :desired_wage
      t.string :recommended_by
      t.json :experience
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
