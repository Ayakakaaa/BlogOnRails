class CommentsController < ApplicationController
    before_action :get_post、:set_comment, only: [:destroy]

    def create
        @comment = Comment.new comment_params
        @comment.post = @post
        if @comment.save
            flash[:notice] = 'Comment Created Successfully'
            redirect_to post_path(@post)
        else
            flash[:error] = 'Comment invalid. message is empty'
            redirect_to post_path(@post)
        end
    end

    def destroy
        @comment.destroy
        redirect_to post_path(@post.id)
    end


    private

    def get_post
        @post = Post.find(params[:post_id])
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:message, :post_id)
    end
end
