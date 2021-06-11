Rails.application.routes.draw do

  root 'student_grades#index'

  resources :student_grades
  resources :lectures
  resources :semesters
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
