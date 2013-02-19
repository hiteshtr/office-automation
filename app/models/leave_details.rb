class LeaveDetails < ActiveRecord::Base
  attr_accessible :leave_id,         :leave_from, 
                  :leave_to,         :leave_duration, 
                  :student_id,           :leave_reason, 
                  :academic_status,  :hostel_status,
                  :other_status, :final_comment,
                  :arrival_time,     :departure_time,
                  :academic_session, :course, :leave_status_reports_attributes
  validates :student_id, :leave_from, :leave_to, :leave_duration, :leave_reason, :final_comment,  :presence => true
  validates_presence_of :student_id, :leave_from, :leave_to, :leave_duration, :leave_reason, :final_comment
  has_many :leave_status_reports
  has_many :leave_details_others
  belongs_to :student, :class_name => "Student", :foreign_key => :student_id
end