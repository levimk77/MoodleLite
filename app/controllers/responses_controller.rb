class ResponsesController < ApplicationController
    def index
    end

    def show
        @response = Response.find(params[:id])
    end

    def new
        @response = Response.new
    end

    def create
        @response = Response.new(course_params)
        if @response.save?
            redirect_to course_path(@response)
        else
            flash[:error] = @response.errors.full_messages
            render :new
        end
    end

    def edit
        @response = Response.find(params[:id])
    end

    def update
    end

    def destroy
        @response = Response.find(params[:id]).destroy
    end

    private
    def response_params
        params.require(:response).permit(:content, :student_id, :post_id)
    end
end
