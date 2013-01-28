class LeaveDetails < ActiveRecord::Base
   attr_accessible :leave_id,         :leave_from, 
                  :leave_to,         :leave_duration, 
                  :reg_no,           :leave_reason, 
                  :academic_status,  :hostel_status,
                  :other_status,     :reg_no,
                  :academic_session, :course
  validates :reg_no, :leave_from, :leave_to, :leave_duration, :leave_reason,  :presence => true
  validates_presence_of :reg_no, :leave_from, :leave_to, :leave_duration, :leave_reason
  validates :leave_duration, :length => { :minimum => 1 }
end