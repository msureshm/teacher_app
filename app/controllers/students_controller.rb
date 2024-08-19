class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice] = "Student was successfully updated"
      redirect_to students_path
    else
      flash[:alert] = "Student could not be updated"
      render :edit
    end
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

  private

  def student_params
    params.require(:student).permit(:name, :subject, :marks)
  end
end