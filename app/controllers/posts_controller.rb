class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])
        @response = Response.new
        #byebug
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.student = current_user
        if @post.save
            redirect_to post_path(@post)
        else
            flash[:error] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        @response = Response.new
        render :edit
    end

    def update
        @post = Post.find(params[:id])
        @post.assign_attributes(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            flash[:error] = @post.errors.full_messages
            render :new
        end
    end

    def destroy
        @post = Post.find(params[:id]).destroy
        redirect_to courses_path
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :course_id)
    end
end
