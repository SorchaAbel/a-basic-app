class AccessController < ApplicationController
  def index
    menu
    render('menu')
  end

  def menu
  end

  def login
  end

  def attempt_login
    authorised_user = Administrators.authenticate(params[:username], params[:password])
    if authorised_user
      session[:user_id] = authorised_user.username
      flash[:notice]= "You are logged in"
      redirect_to students_path
    else
      flash[:notice] = "Invalid login"
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_name] = nil
    flash[:notice] = "Logged Out"
    redirect_to(:action => 'login')
  end
end
