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
        @response = Response.new(response_params)
        if @response.save
            redirect_to post_path(@response.post)
        else
            flash[:error] = @response.errors.full_messages
            redirect_to post_path(@response.post)
        end
    end

    def edit
        @response = Response.find(params[:id])
    end

    def update
    end

    def destroy
        @response = Response.find(params[:id]).destroy
        redirect_to post_path(@response.post)
    end

    private
    def response_params
        params.require(:response).permit(:content, :student_id, :post_id)
    end
end
