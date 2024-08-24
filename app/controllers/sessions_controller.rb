class SessionsController < ApplicationController
  skip_before_action :authenticate_teacher!, only: [:new, :create]

  def new
  end

  def create
    @teacher = Teacher.find_by(email: teacher_params[:email])
    if @teacher && @teacher.authenticate(teacher_params[:password])
      session[:teacher_id] = @teacher.id
      flash[:notice] = "Logged in successfully"
      redirect_to root_path
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:teacher_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to new_session_path
  end

  private

  def teacher_params
    params.permit(:email, :password)
  end
end