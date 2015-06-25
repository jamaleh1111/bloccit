class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comment.(params.require(:comment).permit(:body))
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@post, @comment]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new # there is no new?

  end
end
