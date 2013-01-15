class CreateHostelLeaves < ActiveRecord::Migration
  def change
    create_table :hostel_leaves do |t|

      t.timestamps
    end
  end
end
