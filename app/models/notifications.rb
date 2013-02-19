class Notifications < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :subject, :body, :msg_ype, :priority, :sent_from, :sent_to
end
