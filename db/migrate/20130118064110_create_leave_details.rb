class CreateLeaveDetails < ActiveRecord::Migration
  def change
    create_table :leave_details, {:id=>false} do |t|
      t.string  :leave_id
      t.string  :reg_no
      t.date    :leave_from
      t.date    :leave_to
      t.integer :leave_duration
      t.text    :leave_reason
      t.boolean :academic_status
      t.boolean :warden_status
      t.boolean :other_status

      t.timestamps
      end
	  execute "ALTER TABLE leave_details ADD PRIMARY KEY (leave_id);"
  end
end
