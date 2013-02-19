class HmmsController < ApplicationController
  def index
  end

  def leave_apply
    @leaveDetail = LeaveDetails.new
    @acadSession = getCurrentAcademicSession
  end
  
  def add
    
   @student_id = params[:leave][:student_id]
    if !@leaveDetail = LeaveDetails.create!(params[:leave])
      flash[:error] = "Some Error! Please Try Again!"

    else
      flash[:success] = "Leave has been saved successfully!"
      @leaveDetail.save      
    end
        
    redirect_to(leaveSuccessful_path(:student_id => @student_id ))

  end

  def viewleave
    @student_id = params[:student_id]
    if @student_id == ""
      @student_id = "UG10001"
    end
    @viewLeave = LeaveDetails.where("student_id = ?", @student_id)
    
  end
  
  def leaveApproval
    
    @showLeave = LeaveDetails.where("academic_status = ?", "PENDING")
    
  end
  
  def prevLeaveApp
    
    @showLeaveEverything = LeaveDetails.where("academic_status != ?", "PENDING")
      
  end
  
  def leaveApprovalWarden
    
    @showLeave = LeaveDetails.where("warden_status=?", "PENDING")
    
  end
  
  def leaveInfo
    
    @leave_id = params[:id_param]
    puts "------------- "+@leave_id+" -----------"
    @showInfo = LeaveDetails.where("leave_id=?", @leave_id)
    @insertLeaveStatusReport = LeaveStatusReport.new
    
  end
  
  # Method below does the following two tasks
  # 1. Approval of Leave by Hostel Warden.
  # 2. Updat the LeaveStatusReport(monitors the processing of Leave Application)
  
  def approveLeaveWarden
    
    @leaveid = params[:id_param]
    @leaveUpdate = LeaveDetails.find(@leaveid)
    
    if @leaveUpdate.update_attribute('warden_status', "APPROVED")
    
      flash[:success] = "Leave "+@leaveUpdate.leave_id_prefix+@leaveUpdate.leave_id.to_s()+"/"+@leaveUpdate.academic_session+" Has been Approved!" 
      redirect_to :leaveApprovalWarden
      
    end
    
  end
  
  # Method below does the following two tasks
  # 1. Rejection of Leave by Hostel Warden.
  # 2. Update the LeaveStatusReport(which monitors the processing of Leave Application)
  
  def rejectLeaveWarden
    
    @leaveid = params[:id_param]
    @leaveUpdate = LeaveDetails.find(@leaveid)
        
    if @leaveUpdate.update_attribute('warden_status', "REJECTED")
    
      flash[:success] = "Leave "+@leaveUpdate.leave_id_prefix+@leaveUpdate.leave_id.to_s()+"/"+@leaveUpdate.academic_session+" Has been Rejected!"
      redirect_to :leaveApprovalWarden
    
    end
    
  end
  
  # Method below does the following two tasks
  # 1. Approval of Leave by Academic Co-ordinator
  # 2. Updat the LeaveStatusReport(monitors the processing of Leave Application)
  
  def approveLeave
    
    @leaveid = params[:id_param]
    @leaveUpdate = LeaveDetails.find(@leaveid)
    
    @acadSession = getCurrentAcademicSession
    puts "-/-/-/-/-/-/- "+@leaveUpdate.academic_session+" -/-/-/-/-/-/-/-/-/"
    puts "-/-/-/-/-/-/- "+@acadSession+" -/-/-/-/-/-/-/-/-/"
    
    @insertLeaveStatusReport = LeaveStatusReport.create!(:leave_id => @leaveid, :leave_id_prefix => "L", :academic_session => @acadSession, :comment => "Your Leave Has been Approved", :sent_from => "ajeetk",\
    :sent_to => "hiteshtr")
    if @leaveUpdate.update_attribute('academic_status', "APPROVED") && @leaveUpdate.update_attribute('other_status', "APPROVED") && @leaveUpdate.update_attribute('final_comment', "Leave has been Approved")
    
      flash[:success] = "Leave "+@leaveUpdate.leave_id_prefix+@leaveUpdate.leave_id.to_s()+"/"+@leaveUpdate.academic_session+" Has been Approved!" 
      redirect_to :leaveApproval
      
    end
      
  end
  
  # Method below does the following two tasks
  # 1. Rejection of Leave by academic co-ordinator.
  # 2. Update the LeaveStatusReport(which monitors the processing of Leave Application)
  
  def rejectLeave
    
    @leaveid = params[:id_param]
    @leaveUpdate = LeaveDetails.find(@leaveid)
    @acadSession = getCurrentAcademicSession
    @reason = "Leave Has Been rejected without giving any particular reason! Contact Academic Co-ordinator/ Hostel Warden"
    @insertLeaveStatusReport = LeaveStatusReport.create!(:leave_id => @leaveid, :leave_id_prefix => "L", :academic_session => @acadSession, :comment => @reason, :sent_from => "ajeetk", :sent_to => "hiteshtr")    
    if @leaveUpdate.update_attribute('academic_status', "REJECTED") && @leaveUpdate.update_attribute('other_status', "REJECTED") && @leaveUpdate.update_attribute('final_comment', @reason)
    
      flash[:success] = "Leave "+@leaveUpdate.leave_id_prefix+@leaveUpdate.leave_id.to_s()+"/"+@leaveUpdate.academic_session+" Has been Rejected!"
      redirect_to :leaveApproval
    
    end
    
  end
  
  ## Method below does the following two tasks 
  # 1. Updating the reason to be provided by concerned authorities for Rejecting the Leave
  # 2. Update the LeaveStatusReport(which monitors the processing of Leave Application)
  
  def updateReason
    
    @reason = params[:reject_reason]
    puts "---------- "+@reason+" ----------"
    
    if @reason == ""
      
      @reason = "Leave Has Been rejected without giving any particular reason! Contact Academic Co-ordinator/Hostel Warden."
      
    end
    
    @leaveid = params[:id_param]
    puts "----------- "+@leaveid.to_s()+" ---------"
    
    @acadSession = getCurrentAcademicSession
    
    @insertLeaveStatusReport = LeaveStatusReport.create!(:leave_id => @leaveid, :leave_id_prefix => "L", :academic_session => @acadSession, :comment => @reason, :sent_from => "ajeetk", :sent_to => "hiteshtr")
    
    @leaveUpdateReason = LeaveDetails.find(@leaveid)
    
    if @leaveUpdateReason.update_attribute('academic_status', "REJECTED") && @leaveUpdateReason.update_attribute('other_status', "REJECTED") && @leaveUpdateReason.update_attribute('final_comment', @reason)      
      
      flash[:success] = "Leave "+@leaveUpdateReason.leave_id_prefix+@leaveUpdateReason.leave_id.to_s()+"/"+@leaveUpdateReason.academic_session+" Has been Rejected!"
      
    end
    
    redirect_to :leaveApproval
    
  end
  
  # This function is used to undo the task done by Academic Co-ordinator or Hostel Co-ordinator
  
  def undoLeaveApproval
    
    @leaveid = params[:id_param]
    @leaveUpdate = LeaveDetails.find(@leaveid)
    @acadSession = getCurrentAcademicSession
    @insertLeaveStatusReport = LeaveStatusReport.create!(:leave_id => @leaveid, :leave_id_prefix => "L", :academic_session => @leaveUpdate.academic_session, :comment => "The last transaction has been Undone. Wait for further Communication", \
    :sent_from => "ajeetk", :sent_to => "hiteshtr")
    
    if @leaveUpdate.update_attribute('academic_status', "PENDING") && @leaveUpdate.update_attribute('other_status', "PENDING") && @leaveUpdate.update_attribute('final_comment', "UNDER PROCESSING")
      
      flash[:success] = "Undo Process has been done successfully on "+@leaveUpdate.leave_id_prefix+@leaveUpdate.leave_id.to_s()+"/"+@leaveUpdate.academic_session
      redirect_to :prevLeaveApp
      
    end
    
  end
  
  def showLeaveStatus
    
    @leaveid = params[:id]
    puts "-/-/-/-/-/-/-/-/ "+@leaveid+" /-/-/-/-/-/-/--/-/-/"
    
    @leaveStatus = LeaveStatusReport.where("leave_id = ? ", @leaveid)
    
    respond_to do |format|
      format.js { render :json => @leaveStatus}
    
    end
    
  end
  
  def createNotifications(subject, priority, body, sent_to, sent_from, type)
    
   # @createNotification = Notifications.new
    puts @subject
    puts @sent_from
    puts @sent_to
    if @createNotification = Notifications.create!(:subject => @subject, :body => @body, :msg_ype=> @type, :priority => @priority, :sent_from => @sent_from, :sent_to => @sent_to)
      
     puts "Notification Added Successfully!"
      
    end
      
  end
  
  def sendLeaveNotification
    
    @leaveid = params[:leaveid_param]
    
    @leaveDetailsOther = LeaveDetails.find(@leaveid)
    
    @priority = params[:priority]
    
    @body = params[:body]
    @body_append = "Go to Leave Application Section"
    @body = @body + @body_append
    
    @subject = "Regarding Leave Application(L"+@leaveid+")"
    
    @sent_to = params[:recipients]
    @type = "Leave Application"
    recipients_array = @sent_to.split
    puts recipients_array.length
    puts recipients_array
    @sent_from = "ajeetk"
    for i in 0...recipients_array.length
     
      puts recipients_array[i]
      @sent_to = recipients_array[i]
      puts @sent_to+"Hello..!"
      createNotifications(@subject, @priority, @body, @sent_to, @sent_from, @type)
      @insertLeaveStatusReport = LeaveStatusReport.create!(:leave_id => @leaveid, :leave_id_prefix => "L", :academic_session => getCurrentAcademicSession, :comment => "Your leave has been forwarded to "\
      +@sent_to+". Wait for further Communication!", :sent_from => "ajeetk", :sent_to => "hiteshtr")
      @insertLeaveOther = @leaveDetailsOther.leave_details_others.create!(:sent_to => @sent_to, :sent_from => "ajeetk", \
      :comment => "UNDER PROCESSING") 
    
    end
    
    redirect_to :sentReview
    
  end
  
  def showNotifications
    
    @currentuser = "zafar"
    @allNotification = Notifications.where("sent_to = ?", @currentuser)
    
  end
  
  def showNotification
    
    @notification_id = params[:id]
    @currentuser = "zafar"
    @showNotification = Notifications.where("id = ? AND sent_to = ?", @notification_id, @currentuser)
    
  end
  
  def showLeaveInfoOther
    
    @recipient = "zafar"
    @leaveid = params[:leaveid_param]
    
    @showLeaveInfoOther = LeaveDetailsOther.where("leave_id = ? AND sent_to = ? ", @leaveid, @recipient)
    
  end
  
  def leaveApprovalOther
    
    @recipient = "zafar"
    @showLeaveDetailsByOther = LeaveDetailsOther.where("sent_to=? AND leave_status = ?", @recipient, "PENDING")
    
  end
  
  def approveLeaveOther
    
    @leaveid = params[:leaveid_param]
    @currentuser = "zafar"
    
    @leaveApproveOther = LeaveDetailsOther.find_by_leave_id_and_sent_to(@leaveid, @currentuser)
    
    if @leaveApproveOther.update_attributes(:leave_status => 'APPROVED', :comment => 'Leave Approved!')
      
      @subject = "Regarding Leave Application["+@leaveApproveOther.leave.leave_id_prefix+@leaveApproveOther.leave.leave_id.to_s+"/"+@leaveApproveOther.leave.academic_session+"]"
      @priority = "High"
      @body = "Leave application has been Approved by "+@currentuser
      @sent_to = @leaveApproveOther.sent_from
      @sent_from = @currentuser
      @type = "Leave Application" 
      createNotifications(@subject, @priority, @body , @sent_to, @sent_from, @type)
      flash[:success] = "Leave application ["+@leaveApproveOther.leave.leave_id_prefix+@leaveApproveOther.leave.leave_id.to_s+"/"+@leaveApproveOther.leave.academic_session+"] has been Approved."
      redirect_to :leaveApprovalOther
      
    end
    
  end
  
  def rejectLeaveOther
    
    @leaveid = params[:leaveid_param]
    @currentuser = "zafar"
    
    @leaveRejectOther = LeaveDetailsOther.find_by_leave_id_and_sent_to(@leaveid, @currentuser)
    
    if @leaveRejectOther.update_attributes(:leave_status => 'REJECTED', :comment => 'Leave Rejected Without any reason!')
      
      @subject = "Regarding Leave Application["+@leaveRejectOther.leave.leave_id_prefix+@leaveRejectOther.leave.leave_id.to_s+"/"+@leaveRejectOther.leave.academic_session+"]"
      @priority = "High"
      @body = "Leave application has been rejected by "+@currentuser
      @sent_to = @leaveRejectOther.sent_from
      @sent_from = @currentuser
      @type = "Leave Application" 
      createNotifications(@subject, @priority, @body , @sent_to, @sent_from, @type)
      flash[:success] = "Leave application ["+@leaveRejectOther.leave.leave_id_prefix+@leaveRejectOther.leave.leave_id.to_s+"/"+@leaveRejectOther.leave.academic_session+"] has been Rejected."
      redirect_to :leaveApprovalOther
      
    end
    
  end
  
  def undoLeaveApprovalOther
    
    @currentuser = "zafar"
    @leaveid = params[:leaveid_param]
    
    @leaveShowOther = LeaveDetailsOther.find_by_leave_id_and_sent_to(@leaveid, @currentuser)
    puts @leaveShowOther.class
    
    if @leaveShowOther.update_attributes(:leave_status => 'PENDING', :comment => "UNDER PROCESSING")
    
      @subject = "Regarding Leave Application["+@leaveShowOther.leave.leave_id_prefix+@leaveShowOther.leave.leave_id.to_s+"/"+@leaveShowOther.leave.academic_session+"]"
      @priority = "High"
      @body = "Last Transaction has been Undone by "+@currentuser+". Wait for further communication!"
      @sent_to = @leaveShowOther.sent_from
      @sent_from = @currentuser
      @type = "Leave Application" 
      createNotifications(@subject, @priority, @body , @sent_to, @sent_from, @type)
      flash[:success] = "Last Transaction on Leave application ["+@leaveShowOther.leave.leave_id_prefix+@leaveShowOther.leave_id.to_s+"/"+@leaveShowOther.leave.academic_session+"] has been Undone."
      redirect_to :prevLeaveAppOther
      
    end
    
  end
  
  def prevLeaveAppOther
    
    @currentuser = "zafar"
    @showLeaveEverything = LeaveDetailsOther.where("sent_to = ? AND leave_status != ?", @currentuser, "PENDING")
    
  end
  
  def updateReasonOther
    
    @currentuser = "zafar"
    @reason = params[:reject_reason]
    puts "---------- "+@reason+" ----------"
    
    if @reason == ""
      
      @reason = "Leave Has Been rejected."
      
    end
    
    @leaveid = params[:leaveid_param]
    puts "----------- "+@leaveid.to_s()+" ---------"
    
    @acadSession = getCurrentAcademicSession
    
    #@insertLeaveStatusReport = LeaveStatusReport.create!(:leave_id => @leaveid, :leave_id_prefix => "L", :academic_session => @acadSession, :comment => @reason, :sent_from => "ajeetk", :sent_to => "hiteshtr")
    
    @leaveUpdateReasonOther = LeaveDetailsOther.find_by_leave_id_and_sent_to(@leaveid, @currentuser)
    
    if @leaveUpdateReasonOther.update_attributes(:leave_status => "REJECTED", :comment => @reason)  
      
      flash[:success] = "Leave "+@leaveUpdateReasonOther.leave.leave_id_prefix+@leaveUpdateReasonOther.leave_id.to_s()+"/"+@leaveUpdateReasonOther.leave.academic_session+" Has been Rejected!"
      
    end
    
    redirect_to :leaveApprovalOther
    
  end
  
  def sendLeaveNotificationOther
    
    @leaveid = params[:leaveid_param]
    @currentuser = "zafar"
    @leaveDetailsOther = LeaveDetailsOther.find_by_leave_id_and_sent_to(@leaveid, @currentuser)
    
    @priority = params[:priority]
    
    @body = params[:body]
    @body_append = "Go to Leave Application Section"
    @body = @body + @body_append
    
    @subject = "Regarding Leave Application(L"+@leaveid+")"
    
    @sent_to = params[:recipients]
    @type = "Leave Application"
    recipients_array = @sent_to.split
    puts recipients_array.length
    puts recipients_array
    @sent_from = @currentuser
    for i in 0...recipients_array.length
     
      puts recipients_array[i]
      @sent_to = recipients_array[i]
      puts @sent_to+"Hello..!"
      createNotifications(@subject, @priority, @body, @sent_to, @sent_from, @type)
      @insertLeaveStatusReport = LeaveStatusReport.create!(:leave_id => @leaveid, :leave_id_prefix => "L", :academic_session => getCurrentAcademicSession, :comment => "Your leave has been forwarded to "\
      +@sent_to+". Wait for further Communication!", :sent_from => @currentuser, :sent_to => "hiteshtr")
      @insertLeaveOther = LeaveDetailsOther.create!(:leave_id => @leaveid, :sent_to => @sent_to, :sent_from => @currentuser, \
      :comment => "UNDER PROCESSING") 
    
    end
    
    redirect_to :sentReviewOther
    
  end
  
  def showDetailsOther
    
    @leaveid = params[:leaveid_param]
    @currentuser = "zafar"
    
    @showDetailsOther = LeaveDetailsOther.where("leave_id = ? AND sent_from = ?",@leaveid, @currentuser)
    
  end
  
end