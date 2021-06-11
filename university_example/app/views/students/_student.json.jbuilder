json.extract! student, :id, :first_name, :last_name, :matriculation_nr, :birthday, :created_at, :updated_at
json.url student_url(student, format: :json)
