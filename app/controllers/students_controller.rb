class StudentsController < ApplicationController

  def index
    # byebug
    # params[:name] ? 
      # render json: Student.where(first_name: params[:name]) 
      # || render json: Student.where(last_name: params[:name]) 
    # : 
      # render json: Student.all
      if params[:name]
        students = Student.select{|s| s.first_name.downcase == params[:name].downcase || s.last_name.downcase == params[:name].downcase }
      else 
        students = Student.all
      end
      render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
