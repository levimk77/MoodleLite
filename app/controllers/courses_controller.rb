class CoursesController < ApplicationController
    def index
    end

    def show
        @course = Course.find(params[:id])
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        if @course.save
            redirect_to course_path(@course)
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
        @course = Course.find(params[:id]).destroy
    end

    private
    def course_params
        params.require(:course).permit(:code, :name, :teacher, :department, :admin_id)
    end
end
