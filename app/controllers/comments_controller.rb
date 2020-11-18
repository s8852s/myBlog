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
            
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
