# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

500.times do |i|
  student_name = Faker::Name.name.split(" ")
  Student.create(first_name: student_name[0], last_name: student_name[1], matriculation_nr: 321450 + i, birthday: Faker::Date.between(from: 30.years.ago, to: 18.years.ago))
end

(15..20).each do |year|
  Semester.create(name: "WiSe#{year}/#{year+1}")
  Semester.create(name: "SoSe#{year+1}")  
end

10.times do |i|
  course_name = Faker::Educator.unique.course_name
  Semester.all.each do |semester|
    Lecture.create(name: course_name, semester: semester)    
  end
end

Student.all.each do |student|
  Lecture.pluck(:id).sample(Faker::Number.within(range: 1..20)).each do |lecture_id|
    StudentGrade.create(student: student, lecture_id: lecture_id, points: Faker::Number.within(range: 0..100))    
  end
end
