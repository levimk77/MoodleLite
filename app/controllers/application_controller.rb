class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def logged_in?
        !session[:student_id].nil?
    end

    def current_user
        if logged_in?
            @current_user = Student.find(session[:student_id])
        end
    end

    def authorize
        redirect_to "/login" unless logged_in?
    end
end
