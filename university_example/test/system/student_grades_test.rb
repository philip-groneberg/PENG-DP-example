require "application_system_test_case"

class StudentGradesTest < ApplicationSystemTestCase
  setup do
    @student_grade = student_grades(:one)
  end

  test "visiting the index" do
    visit student_grades_url
    assert_selector "h1", text: "Student Grades"
  end

  test "creating a Student grade" do
    visit student_grades_url
    click_on "New Student Grade"

    fill_in "Lecture", with: @student_grade.lecture_id
    fill_in "Points", with: @student_grade.points
    fill_in "Student", with: @student_grade.student_id
    click_on "Create Student grade"

    assert_text "Student grade was successfully created"
    click_on "Back"
  end

  test "updating a Student grade" do
    visit student_grades_url
    click_on "Edit", match: :first

    fill_in "Lecture", with: @student_grade.lecture_id
    fill_in "Points", with: @student_grade.points
    fill_in "Student", with: @student_grade.student_id
    click_on "Update Student grade"

    assert_text "Student grade was successfully updated"
    click_on "Back"
  end

  test "destroying a Student grade" do
    visit student_grades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student grade was successfully destroyed"
  end
end
