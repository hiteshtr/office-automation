class LeaveDetails < ActiveRecord::Base
  attr_accessible :leave_id,        :leave_from, 
                  :leave_to,        :leave_duration, 
                  :reg_no,          :leave_reason, 
                  :academic_status, :hostel_status,
                  :other_status
  validates :leave_from,    :presence => true
  validate  :leave_to,      :presence => true
  validates :leave_reason,  :presence => true
  validates :leave_duration,:presence => true 
end
