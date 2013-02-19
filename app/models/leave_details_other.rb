class LeaveDetailsOther < ActiveRecord::Base
  attr_accessible :leave_id, :sent_from, :sent_to, :leave_status, :comment
  belongs_to :leave, :class_name => "Leave", :foreign_key => "leave_id"
end
