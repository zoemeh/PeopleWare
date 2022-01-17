class CreateTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :trainings do |t|
      t.string :description
      t.string :level
      t.date :from_at
      t.date :to_at
      t.string :institution

      t.timestamps
    end
  end
end
