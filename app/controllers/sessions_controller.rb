class SessionsController < ApplicationController

    def new
    end

    def create
        student = Student.find_by(email: params[:email])
        if student && student.authenticate(params[:password])
            session[:student_id] = student.id
            redirect_to student_path(student)
        else
            flash[:message] = "We cannot find your account based on the information you provided."
            render 'new'
        end
    end

    def destroy
        session.delete(:student_id)
        redirect_to "/login"
    end

    
end