class StudentsController < ApplicationController
  #DRY
  before_action :set_student, only: %i[show edit update destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    #Redirect to student
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  #Implementing show action
  def show
  end

  #Editing Student
  def edit
  end
    
  #Update Student
  def update
    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit
    end
  end

  #Destroy Student
  def destroy
    @student.destroy
    redirect_to students_path
  end
    
  private

  def set_student
    @student = Student.find(params[:id])
  end
  
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end
end