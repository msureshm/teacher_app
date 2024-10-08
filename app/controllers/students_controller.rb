# frozen_string_literal: true

# Controller to manage students
class StudentsController < ApplicationController
  def index
    @student = Student.new
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.find_or_initialize_by(name: student_params[:name], subject: student_params[:subject])
    @student.marks = student_params[:marks]
    if @student.persisted?
      @student.save
      flash[:notice] = 'Student Marks updated'
      redirect_to students_path
    else 
      flash[:notice] = @student.save ? 'Student created' : 'Student could not be created'
      redirect_to students_path
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice] = 'Student was successfully updated'
      redirect_to students_path
    else
      flash[:alert] = 'Student could not be updated'
      redirect_to students_path
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      flash[:notice] = 'Student was successfully deleted'
      redirect_to students_path
    else
      flash[:alert] = 'Student could not be deleted'
      redirect_to root_path
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :subject, :marks)
  end
end
