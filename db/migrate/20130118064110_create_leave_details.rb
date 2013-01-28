class CreateLeaveDetails < ActiveRecord::Migration
  def change
    create_table :leave_details, {:id=>false} do |t|
      t.integer :leave_id
      t.string  :leave_id_prefix, :null => false, :default => "L"
      t.string  :reg_no, :null => false
      t.date    :leave_from, :null => false
      t.date    :leave_to, :null => false
      t.integer :leave_duration, :null => false
      t.text    :leave_reason, :null => false
      t.boolean :academic_status, :default => '0', :null => false
      t.boolean :warden_status, :default => '0', :null => false
      t.boolean :other_status, :default => '0', :null => false
      t.string  :academic_session, :null => false
      t.string  :course, :null => false

      t.timestamps
    end
      execute "ALTER TABLE leave_details ADD PRIMARY KEY (leave_id);"
      execute "ALTER TABLE leave_details MODIFY leave_id INTEGER NOT NULL AUTO_INCREMENT;"
  end
end