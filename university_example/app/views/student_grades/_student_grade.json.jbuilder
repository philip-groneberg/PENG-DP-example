json.extract! student_grade, :id, :student_id, :lecture_id, :points, :created_at, :updated_at
json.url student_grade_url(student_grade, format: :json)
