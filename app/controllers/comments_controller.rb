class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comment.(params.require(:comment).permit(:body))
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = @post

  end
end
