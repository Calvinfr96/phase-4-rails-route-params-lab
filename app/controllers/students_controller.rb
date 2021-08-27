class StudentsController < ApplicationController

  def index
    students = 
    if params[:name]
      Student.by_name(params[:name])
    else
      Student.all
    end
    render json: students
  end

  def show
    id = params[:id]
    student = Student.find(id)
    render json: student
  end
end
