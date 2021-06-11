class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :matriculation_nr
      t.date :birthday

      t.timestamps
    end
  end
end
