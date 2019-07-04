class StudentsController < ApplicationController
    $majors =  ["English", "Math", "Accounting", "Physics", "Biology", "Finance", "Economics", "Chemistry", "Film Studies", "Fashion Design", "Anthropology", "History", "Art History", "Engineering", "Geography", "Philosophy", "Meteorology", "Social Work", "Political Science", "Music Education"]
    $years = ["Freshman", "Sohpomore", "Junior", "Senior"]
   
    def index
        if params[:q]
            if Student.find_student(params[:q], params[:year], params[:major]) != []
                @students = Student.find_student(params[:q], params[:year], params[:major])
            else
                flash[:alert] = "student not found"
                redirect_to '/students'
            end
        else
            @students = Student.all
        end
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
        @student = Student.find(params[:id])
        @student.assign_attributes(student_params)
        if @student.valid?
        @student.save
        redirect_to student_path(@student)
        else 
         flash[:error] = @student.errors.full_messages
            render :edit
        end
    end

    def destroy
        session.delete(:student_id)
        @student = Student.find(params[:id]).destroy
        redirect_to "/login"
    end

    def admin
        @student = Student.find(params[:id])
        @student.admin = true
        @student.save
        redirect_to students_path
    end

    def unadmin
        @student = Student.find(params[:id])
        @student.admin = false
        @student.save
        redirect_to students_path
    end

    def banned
        @student = Student.find(params[:id])
        @student.banned = true
        @student.save
        redirect_to students_path
    end

    def unbanned
        @student = Student.find(params[:id])
        @student.banned = false
        @student.save
        redirect_to students_path
    end

    private
    def student_params
        params.require(:student).permit(:name, :age, :email, :year, :major, :password, :password_confirmation)
    end
end
