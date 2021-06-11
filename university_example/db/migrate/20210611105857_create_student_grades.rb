class CreateStudentGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :student_grades do |t|
      t.references :student, foreign_key: true
      t.references :lecture, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
