class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :cedula
      t.string :name
      t.date :hired_date
      t.references :job, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true
      t.float :wage
      t.boolean :status

      t.timestamps
    end
  end
end
