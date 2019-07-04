class CoursesController < ApplicationController
    def index
        if params[:q]
            if Course.find_course(params[:q]) != []
                @courses = Course.find_course(params[:q])
            else
                flash[:alert] = "course not found"
                redirect_to '/courses'
            end
        else
            @courses = Course.all
        end
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
        byebug
        @course = Course.find(params[:course][:id].to_i)
        @course.destroy
        redirect_to new_course_path
    end

    private
    def course_params
        params.require(:course).permit(:code, :name, :teacher, :department, :admin_id)
    end
end
