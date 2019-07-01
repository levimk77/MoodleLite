class StudentsController < ApplicationController
    $majors =  ["English", "Math", "Accounting", "Physics", "Biology", "Finance", "Economics", "Chemistry", "Film Studies", "Fashion Design", "Anthropology", "History", "Art History", "Engineering", "Geography", "Philosophy", "Meteorology", "Social Work", "Political Science", "Music Education"]
    $years = ["Freshman", "Sohpomore", "Junior", "Senior"]
   
    def index
    end

    def show
        @student = Student.find(params[:id])
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            session[:student_id] = @student.id
            redirect_to student_path(@student)
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
        params.require(:student).permit(:name, :age, :email, :year, :major, :password, :password_confirmation)
    end
end
