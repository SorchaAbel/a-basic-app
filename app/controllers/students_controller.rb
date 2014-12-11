class StudentsController < ApplicationController
  # CanCanCan or Pundit
  before_filter :check_logged_in

  def index
    @students = Student.allstudents
    respond_to do |format|
      format.html
      format.json { render :json => @students }
    end
  end

  def show
    @student = Student.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @student }
    end
  end

  def edit
    @student = Student.find_by_id(params[:id])
  end

  def update
    @student = Student.find_by_id(params[:id])
    params.permit!
    if @student.update_attributes(params[:student])
      redirect_to students_url
    else
      render('edit')
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.present?
      @student.destroy
    end
    redirect_to students_url
  end

  def new
    # notice is going to record validation errors, set to nil at start
    flash[:notice] = nil
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if student_params[:dob].present?
      @student.dob = Date.strptime(student_params[:dob], "%d/%m/%Y")
    end

    if @student.save
      redirect_to students_url
    else
      flash[:notice] = "Error Processing"
      @val_class = "validation"
      render('new')
    end
  end

 private

  def student_params
    allow = [:name, :dob, :addr1, :addr2, :postcode, :email]
    params.require(:student).permit(allow)
  end

end
