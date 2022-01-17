class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.string :code
      t.string :name
      t.string :status

      t.timestamps
    end
    add_index :languages, :code, unique: true
    add_index :languages, :name, unique: true
  end
end
