class CreateLeaveStatusReports < ActiveRecord::Migration
  def change
    create_table :leave_status_reports do |t|
      
      t.integer :leave_id, :null => false
      t.string  :leave_id_prefix, :null => false, :default => "L"
      t.string  :academic_session, :null => false
      t.text    :comment, :null => false
      t.string  :sent_from, :null => false
      t.string  :sent_to, :null => false
      t.timestamps
    end
  end
end
