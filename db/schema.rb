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

ActiveRecord::Schema.define(:version => 20130218120039) do

  create_table "leave_details", :primary_key => "leave_id", :force => true do |t|
    t.string   "leave_id_prefix",  :default => "L",       :null => false
    t.string   "student_id",                              :null => false
    t.date     "leave_from",                              :null => false
    t.date     "leave_to",                                :null => false
    t.integer  "leave_duration",                          :null => false
    t.text     "leave_reason",                            :null => false
    t.string   "academic_status",  :default => "PENDING", :null => false
    t.string   "warden_status",    :default => "PENDING", :null => false
    t.string   "other_status",     :default => "PENDING", :null => false
    t.string   "academic_session",                        :null => false
    t.text     "final_comment",                           :null => false
    t.string   "course",                                  :null => false
    t.time     "departure_time",                          :null => false
    t.time     "arrival_time",                            :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "leave_details_others", :force => true do |t|
    t.integer  "leave_id",                            :null => false
    t.string   "sent_to",                             :null => false
    t.string   "sent_from",                           :null => false
    t.text     "comment",                             :null => false
    t.string   "leave_status", :default => "PENDING", :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "leave_status_reports", :force => true do |t|
    t.integer  "leave_id",                          :null => false
    t.string   "leave_id_prefix",  :default => "L", :null => false
    t.string   "academic_session",                  :null => false
    t.text     "comment",                           :null => false
    t.string   "sent_from",                         :null => false
    t.string   "sent_to",                           :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "notifications", :force => true do |t|
    t.text     "subject",                       :null => false
    t.text     "body",                          :null => false
    t.string   "msg_ype",                       :null => false
    t.string   "priority",   :default => "LOW", :null => false
    t.string   "sent_from",                     :null => false
    t.string   "sent_to",                       :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "students", :primary_key => "student_id", :force => true do |t|
    t.string   "student_id_prefix"
    t.string   "student_mail"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
