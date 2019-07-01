class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(course_params)
        if @post.save?
            redirect_to course_path(@post)
        else
            flash[:error] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
    end

    def destroy
        @post = Post.find(params[:id]).destroy
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :student_id, :course_id)
    end
end
