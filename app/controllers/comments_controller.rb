class CommentsController < ApplicationController
    def new
        @post = Post.find(params[:post_id])
        @comment = Comment.new
    end
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        if @comment.save
            redirect_to post_path(@post), notice: "成功留言"
        else
            # render :new
        end
    end

    def edit 
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
    end

    def update
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        if @comment.update(comment_params)
            redirect_to post_path(@post), notice: "成功編輯留言"
        else
        end
    end

    def destroy
        @post = Post.find(params[:post_id])

        @comment = Comment.find(params[:id])
        @comment.destroy if @comment 
        redirect_to post_path(@post)  
    end


    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
