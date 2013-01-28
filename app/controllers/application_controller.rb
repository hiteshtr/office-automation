class ApplicationController < ActionController::Base
  protect_from_forgery
  
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
end
