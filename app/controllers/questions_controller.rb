class QuestionsController < ApplicationController
#  before_filter :check_logged_in

  def index
    @questions = Question.allquestions
    respond_to do |format|
      format.html
      format.json { render :json => @questions }
    end
  end

  def show
    @question = Question.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @question }
    end
  end

  def new
    @question = Question.new
  end

  def create
    params.permit!
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = "Record Created"
      redirect_to questions_url
    else
      render('new')
    end
  end

  def edit
    @question = Question.find_by_id(params[:id])
  end

  def update
     params.permit!
    @question = Question.find_by_id(params[:id])
    if @question.update_attributes(params[:question])
      redirect_to questions_url
      flash[:notice] = "Record Updated Sucessfully"
    else
      flash[:notice] = "Error with the page, check values and try again"
      render('edit')
    end
  end

#  def delete
#    @question = Question.find_by_id(params[:id])
#  end

  def destroy
    params.permit!
    @question = Question.find(params[:id])
    if @question.present?
      @question.destroy
    end
    flash[:notice] = "Record Deleted Successfully"
    redirect_to questions_url
  end
end
