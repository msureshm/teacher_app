# frozen_string_literal: true

# Controller to manage students
class StudentsController < ApplicationController
  def index
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
      redirect_to edit_student_path(@student)
    elsif @student.save
      flash[:notice] = 'Student created'
      redirect_to edit_student_path(@student)
    else
      flash[:alert] = 'Student was not created'
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice] = 'Student was successfully updated'
      redirect_to edit_student_path(@student)
    else
      flash[:alert] = 'Student could not be updated'
      render :edit
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
