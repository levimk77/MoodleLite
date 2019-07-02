class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def show
        @course = Course.find(params[:id])
    end

    def new
        @course = Course.new
        @courses = Course.all
        @student = current_user
    end

    def create
        @course = Course.new(course_params)
        @courses = Course.all
        if @course.save
            redirect_to new_course_path
        else
            flash[:error] = @course.errors.full_messages
            render :new
        end
    end

    def edit
        @course = Course.find(params[:id])
    end

    def update
    end

    def destroy
        params[:course][:id].each do |x|
            if x!= "" 
             Course.find(x.to_i).enrollments.destroy_all
             Course.find(x.to_i).destroy
            end
        end
        redirect_to new_course_path
    end

    private
    def course_params
        params.require(:course).permit(:code, :name, :teacher, :department, :admin_id)
    end
end
