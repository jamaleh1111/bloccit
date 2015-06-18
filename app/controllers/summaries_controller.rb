class SummariesController < ApplicationController
  def index
    @summaries = Summary.all
  end

  def new
    @summary = Summary.new
  end

  def show
    @summary = Summary.find(params[:id])
  end

  def edit
    @summary = Summary.find(params[:id])
  end

  def create
    @summary = Summary.new(params.require(:summary).permit(:title, :description, :public))
    if @summary.save
      redirect_to [@topic, @post], notice: "Summary was saved successfully."
    else 
      flash[:error] = "Error creating summary. Please try again."
      render :new
    end 
  end 