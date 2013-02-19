class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students,  {:id => false} do |t|
      t.string   :student_id
      t.string   :student_id_prefix
      t.string   :student_mail
      t.timestamps
    end
    
    execute "ALTER TABLE students ADD PRIMARY KEY(student_id);"
    
  end
end
