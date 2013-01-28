# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130118064110) do

  create_table "leave_details", :primary_key => "leave_id", :force => true do |t|
    t.string   "leave_id_prefix",  :default => "L",   :null => false
    t.string   "reg_no",                              :null => false
    t.date     "leave_from",                          :null => false
    t.date     "leave_to",                            :null => false
    t.integer  "leave_duration",                      :null => false
    t.text     "leave_reason",                        :null => false
    t.boolean  "academic_status",  :default => false, :null => false
    t.boolean  "warden_status",    :default => false, :null => false
    t.boolean  "other_status",     :default => false, :null => false
    t.string   "academic_session",                    :null => false
    t.string   "course",                              :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
