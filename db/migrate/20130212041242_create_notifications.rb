class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text   :subject, :null => false
      t.text   :body, :null => false
      t.string :msg_ype, :null => false
      t.string :priority, :null => false, :default => "LOW"
      t.string :sent_from, :null => false
      t.string :sent_to, :null => false
      t.timestamps
    end
  end
end
