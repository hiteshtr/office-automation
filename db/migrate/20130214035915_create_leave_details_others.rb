class CreateLeaveDetailsOthers < ActiveRecord::Migration
  def change
    create_table :leave_details_others do |t|
      
      t.integer   :leave_id, :null => false
      t.string    :sent_to, :null => false
      t.string    :sent_from, :null => false
      t.text      :comment, :null => false
      t.string    :leave_status, :null => false, :default => "PENDING"

      t.timestamps
    end
  end
end
