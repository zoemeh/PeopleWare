class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :code
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
