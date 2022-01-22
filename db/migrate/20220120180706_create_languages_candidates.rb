class CreateLanguagesCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates_languages, id: false do |t|
      t.belongs_to :candidate
      t.belongs_to :language
    end
  end
end
