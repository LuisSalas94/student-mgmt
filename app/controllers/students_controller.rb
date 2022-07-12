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
    
  #Update Student
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit
    end
  end
  
  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end
end