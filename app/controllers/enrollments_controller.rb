class EnrollmentsController < ApplicationController

    def create
        @enrollment = Enrollment.new(course_id: eval(params[:course_id])[:value])
        @enrollment.student = current_user
        @enrollment.save
        redirect_to courses_path
    end

    def destroy
        Enrollment.find_by(course_id: eval(params[:course_id])[:value], student_id: current_user.id).destroy
        redirect_to student_path(current_user)
    end



    private
    def enrollment_params
        params.permit(eval(params[:course_id])[:value])
    end

end