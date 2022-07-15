class StudentsController < ApplicationController
  #DRY Callback
  before_action :set_student, only: %i[show edit update destroy]

  #Index, New, Create -> Collection Methods, id is not needed
  #Listing data
  def index
    @students = Student.all
  end

  #Instantiate a new resourse
  def new
    @student = Student.new
  end

  #Saves data captured from 'new'
  def create
    @student = Student.new(student_params)
    #Redirect to student
    if @student.save
      redirect_to students_path, notice: "Student has been created successfully"
    else
      render :new
    end
  end

  #Show, Edit, Update, Destroy -> Members Methods, id is needed
  #Implementing show action, fetchting data on browers
  def show
  end

  #Editing Student, fetching resource from database
  def edit
  end
    
  #Update Student, save new info database
  def update
    if @student.update(student_params)
      redirect_to students_path, notice: "Student has been updated successfully"
    else
      render :edit
    end
  end

  #Destroy Student
  def destroy
    @student.destroy
    redirect_to students_path, notice: "Student has been deleted successfully"
  end
    
  private

  def set_student
    @student = Student.find(params[:id])
  end
  
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :date_of_birth, :contact, :address)
  end
end