class StudentGradesController < ApplicationController
  before_action :set_student_grade, only: %i[ show edit update destroy ]

  # GET /student_grades or /student_grades.json
  def index
    @student_grades = StudentGrade.all.includes(:student, lecture: [:semester])
  end

  # GET /student_grades/1 or /student_grades/1.json
  def show
  end

  # GET /student_grades/new
  def new
    @student_grade = StudentGrade.new
  end

  # GET /student_grades/1/edit
  def edit
  end

  # POST /student_grades or /student_grades.json
  def create
    @student_grade = StudentGrade.new(student_grade_params)

    respond_to do |format|
      if @student_grade.save
        format.html { redirect_to @student_grade, notice: "Student grade was successfully created." }
        format.json { render :show, status: :created, location: @student_grade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_grades/1 or /student_grades/1.json
  def update
    respond_to do |format|
      if @student_grade.update(student_grade_params)
        format.html { redirect_to @student_grade, notice: "Student grade was successfully updated." }
        format.json { render :show, status: :ok, location: @student_grade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_grades/1 or /student_grades/1.json
  def destroy
    @student_grade.destroy
    respond_to do |format|
      format.html { redirect_to student_grades_url, notice: "Student grade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_grade
      @student_grade = StudentGrade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_grade_params
      params.require(:student_grade).permit(:student_id, :lecture_id, :points)
    end
end
