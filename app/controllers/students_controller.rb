class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      flash[:notice] = "Student was successfully deleted"
      redirect_to students_path
    else
      flash[:alert] = "Student could not be deleted"
      redirect_to root_path
    end
  end
end