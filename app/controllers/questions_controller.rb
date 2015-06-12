class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body))
    if @question.save
      flash[:notice] = "Question was saved."
      redirect_to @question
    else
      flash[:error] = "There was an error saving the question. Please try again."
      render :new
    end 
  end 

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Post.find(params[:id])
    if @question.update_attributes(params.require(:question).permit(:title, :body))
      flash[:notice] = "Question was updated."
      redirect_to @question
    elsif  
      @question.resolved
      flash[:notice] = "This question has been resolved!"  
    else
      flash[:error] = "There was an error saving the question. Please try again."
      render :edit
    end 
  end

  def resolved
    @question = Question.check_box
  end

  def destroy
    @question = Question.delete
    flash[:notice] = "The question was deleted."
  end
end
