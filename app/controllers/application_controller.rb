class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :require_login

  @reg_no = ""
  
  # This function finds out the current Academic Year
  protected
  def getCurrentAcademicSession
    
    time = Time.new
    month = time.month;
    year = time.year;
    
    if month < 5
      currentAcademicSession = (year-1).to_s()+"/"+year.to_s()
    else
      currentAcademicSession = year.to_s()+"/"+year.to_s()
    end
    
    return currentAcademicSession
  end

  private
  #user session method
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      redirect_to log_in_path
    end
  end

end
