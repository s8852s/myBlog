class PostsController < ApplicationController
    def index 
        @posts = Post.all
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    def new 
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to posts_path, notice: "成功發表新文章!"
        else
            render :new
        end
    end 

    def edit
        @post = Post.find_by(id: params[:id])
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params)
            redirect_to posts_path, notice: "文章編輯完成!"
        else
            render :edit
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end
end
