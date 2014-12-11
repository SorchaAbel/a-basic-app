class ResultsController < ApplicationController

  before_filter :check_logged_in

  def index
    @results = Result.all_results
    respond_to do |format|
      format.html
      format.json { render :json => @results }
    end
  end

  def show
    @result = Result.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @result }
    end
  end

  def edit
    @result = Result.find_by_id(params[:id])
  end

  def update
    params.permit!
    @result = Result.find_by_id(params[:id])
    if @result.update_attributes(params[:result])
      redirect_to results_url
    else
      render('edit')
    end
  end

  def new
    @result = Result.new
  end

  def create
    params.permit!
    @result = Result.new(params[:result])
    if @result.save
      redirect_to results_url
    else
      render('new')
    end
  end

  def destroy
    params.permit!
    @result = Result.find_by_id(params[:id])
    if @result.present?
      @result.destroy
    end
    redirect_to results_url
  end
end
