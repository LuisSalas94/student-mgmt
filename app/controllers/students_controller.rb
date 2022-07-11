class StudentsController < ApplicationController
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
    @student = Student.find(params[:id])
  end

  #Editing Student
  def edit
    @student = Student.find(params[:id])
  end
    
  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end
end