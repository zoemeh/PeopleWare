class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :risk_level
      t.float :wage_min
      t.float :wage_max
      t.boolean :status

      t.timestamps
    end
  end
end
