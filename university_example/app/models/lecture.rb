class Lecture < ApplicationRecord
  belongs_to :semester
  has_many :student_grades
end
