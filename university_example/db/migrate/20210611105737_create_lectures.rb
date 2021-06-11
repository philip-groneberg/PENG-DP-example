class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :name
      t.references :semester, foreign_key: true

      t.timestamps
    end
  end
end
