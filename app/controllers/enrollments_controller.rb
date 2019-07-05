class EnrollmentsController < ApplicationController

    def create
        @enrollment = Enrollment.new(course_id: params[:course_id])
        @enrollment.student = current_user
        @enrollment.save
        redirect_to courses_path
    end

    def destroy
        Enrollment.find_by(course_id: params[:course_id], student_id: current_user.id).destroy
        redirect_to student_path(current_user)
    end

    private
    def enrollment_params
        params.permit(params[:course_id], params[:course][:id])
    end

end