class Student < ActiveRecord::Base
  attr_accessible :student_id, :student_id_prefix, :student_mail
  has_many :leaves
end
