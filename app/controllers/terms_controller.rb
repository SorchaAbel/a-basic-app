class TermsController < ApplicationController
  before_filter :check_logged_in

  def show
    @term = Term.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @term }
    end
  end

  def index
   @terms = Term.allterms
   respond_to do |format|
     format.html
     format.json { render :json => @terms }
   end
  end

  def edit
    @term = Term.find_by_id(params[:id])
  end

  def update
    params.permit!
    @term = Term.find_by_id(params[:id])
    if @term.update_attributes(params[:term])
      redirect_to terms_url
    else
      render('edit')
    end
  end

  def new
    @term = Term.new
  end

  def create
    params.permit!
    @term = Term.new(params[:term])
    if @term.save
      redirect_to terms_url
    else
      render('new')
    end
  end

  def delete
    @term = Term.find_by_id(params[:id])
  end

  def destroy
    params.permit!
    @term = Term.find(params[:id])
    if @term.present?
      @term.destroy
    end
    redirect_to terms_url
  end
end
