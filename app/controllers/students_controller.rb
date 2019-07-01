class StudentsController < ApplicationController
    def index
    end

    def show
        @student = Student.find(params[:id])
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(course_params)
        if @student.save?
            redirect_to course_path(@student)
        else
            flash[:error] = @student.errors.full_messages
            render :new
        end
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
    end

    def destroy
        @student = Student.find(params[:id]).destroy
    end

    private
    def student_params
        params.require(:student).permit(:name, :age, :email, :year, :major)
    end
end
