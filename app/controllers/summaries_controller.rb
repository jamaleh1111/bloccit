class SummariesController < ApplicationController
  def index
    @summaries = Summary.all
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = Summary.new
  end

  def show
    @summary = Summary.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @posts = @summary.posts
  end

  def edit
    @summary = Summary.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:description))
    if @summary.save!
      flash[:notice] = "Summary was saved successfully."
      redirect_to [@topic, @post]
    else 
      flash[:error] = "Error saving summary. Please try again."
      render :new
    end 
  end 

  def update
    @summary = Summary.find(params[:id])
    if @summary.update_attributes(params.require(:summary).permit(:description))
      redirect_to [@topic, @post]
    else 
      flash[:error] = "Error saving summary.  Please try again."
      render :edit
    end 
  end 
end 