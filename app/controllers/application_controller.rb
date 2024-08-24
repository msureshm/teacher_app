# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_teacher!
  helper_method :current_teacher

  private
  def current_teacher
    @current_teacher ||= Teacher.find_by(id: session[:teacher_id])
  end

  def authenticate_teacher!
    if current_teacher.nil?
      flash[:alert] = "You must be logged in to access this page"
      redirect_to new_session_path
    end
  end
end
