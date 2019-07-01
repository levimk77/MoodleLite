class SessionsController < ApplicationController

    def new
    end

    def create
        student = Student.find_by(email: params[:email])
        if student && student.authenticate(params[:password])
            session[:student_id] = student.student_id
            redirect_to student_path(student)
        else
            render 'new'
        end
    end

    def destroy
        session.delete :student_id
        redirect_to "/login"
    end

    
end