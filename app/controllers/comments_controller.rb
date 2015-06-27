class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@post.topic]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@post.topic]
    end 
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was deleted!"
      redirect_to [@post.topic]
    else
      flash[:error] = "There was an error deleting your comment. Please try again."
      redirect_to [@post.topic]
    end 
  end 


  private 
  
  def comment_params
    params.require(:comment).permit(:body)
  end 
 
end 


