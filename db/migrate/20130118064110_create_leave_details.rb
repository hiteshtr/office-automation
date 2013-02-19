class CreateLeaveDetails < ActiveRecord::Migration
  def change
    create_table :leave_details, {:id=>false} do |t|
      t.integer :leave_id
      t.string  :leave_id_prefix, :null => false, :default => "L"
      t.string  :student_id, :null => false
      t.date    :leave_from, :null => false
      t.date    :leave_to, :null => false
      t.integer :leave_duration, :null => false
      t.text    :leave_reason, :null => false
      t.string  :academic_status, :default => 'PENDING', :null => false
      t.string  :warden_status, :default => 'PENDING', :null => false
      t.string  :other_status, :default => 'PENDING', :null => false
      t.string  :academic_session, :null => false
      t.text    :final_comment, :null => false
      t.string  :course, :null => false
      t.time    :departure_time, :null => false
      t.time    :arrival_time, :null => false

      t.timestamps
    end
    execute "ALTER TABLE leave_details ADD PRIMARY KEY (leave_id);"
    execute "ALTER TABLE leave_details MODIFY leave_id INTEGER NOT NULL AUTO_INCREMENT;"
  end
end