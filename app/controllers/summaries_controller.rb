class SummariesController < ApplicationController
  def index
  end

  def new
    @topics = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end

  def show
    @topics = Topic.find(params[:topic_id])
    @posts = Post.find(params[:post_id])
    @summary = @post.summary
  end

  def edit
    @topics = Topic.find(params[:topic_id])
    @post = Post.find(params[:topic_id])
    @summary = Summary.find(params[:summary_id])
  end

  def create
    @summary = Summary.new(params.require(:summary).permit(:description))
    if @summary.save
      redirect_to [@topic, @post] notice: "Summary was saved successfully."
    else 
      flash[:error] = "Error creating summary. Please try again."
      render :new
    end 
  end 

  def update
    @summary = Summary.find(params[:id])
    if @summary.update_attributes(params.require(:summary).permit(:description))
      redirect_to [@topic, @post, @summary]
    else 
      flash[:error] = "Error saving summary.  Please try again."
      render :edit
    end 
  end 
end 