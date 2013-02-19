class LeaveStatusReport < ActiveRecord::Base
  
  attr_accessible :leave_id, :leave_id_prefix, :academic_session, :comment, :sent_from, :sent_to
  belongs_to :leave, :class_name => "Leave", :foreign_key => "leave_id"
  
end
