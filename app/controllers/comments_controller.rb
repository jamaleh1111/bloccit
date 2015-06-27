class CommentsController < ApplicationController
  def create
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @post = @topic.post
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@topic, @post]
    end 
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comment.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was deleted!"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error deleting your comment. Please try again."
      redirect_to [@topic, @post]
    end 
  end 


  private 
  
  def comment_params
    params.require(:comment).permit(:body)
  end 
 
end 


