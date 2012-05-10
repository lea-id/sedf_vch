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

ActiveRecord::Schema.define(:version => 20120429074648) do

  create_table "executions", :force => true do |t|
    t.integer  "year_at"
    t.integer  "serial_no"
    t.string   "resolution"
    t.date     "execute_to"
    t.string   "data_control"
    t.string   "done"
    t.integer  "user_id"
    t.integer  "incoming_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "executions", ["incoming_id"], :name => "index_executions_on_incoming_id"
  add_index "executions", ["user_id"], :name => "index_executions_on_user_id"

  create_table "incomings", :force => true do |t|
    t.integer  "year_at"
    t.integer  "serial_no"
    t.string   "doc_no"
    t.date     "doc_date"
    t.string   "address"
    t.string   "description"
    t.integer  "copy_count"
    t.string   "copy_no"
    t.integer  "pages"
    t.integer  "in_out_no"
    t.integer  "delo_no"
    t.string   "delo_pages"
    t.string   "attach"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "incomings", ["user_id"], :name => "index_incomings_on_user_id"

  create_table "internals", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "attach"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "internals", ["user_id"], :name => "index_internals_on_user_id"

  create_table "notes", :force => true do |t|
    t.integer  "year_at"
    t.date     "date_incoming"
    t.integer  "serial_no"
    t.date     "date_finishing"
    t.integer  "user_id"
    t.integer  "incoming_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "notes", ["incoming_id"], :name => "index_notes_on_incoming_id"
  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "order_sents", :force => true do |t|
    t.string   "who"
    t.string   "letter"
    t.integer  "copy_count"
    t.string   "delo"
    t.integer  "order_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "order_sents", ["order_id"], :name => "index_order_sents_on_order_id"

  create_table "orders", :force => true do |t|
    t.integer  "year_at"
    t.integer  "serial_no"
    t.date     "sign_date"
    t.string   "someone"
    t.string   "description"
    t.integer  "copy_count"
    t.string   "attach"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "outgoings", :force => true do |t|
    t.integer  "year_at"
    t.integer  "serial_no"
    t.string   "doc_no"
    t.date     "doc_date"
    t.string   "address"
    t.string   "description"
    t.integer  "copy_count"
    t.string   "copy_no"
    t.integer  "pages"
    t.integer  "in_out_no"
    t.integer  "delo_no"
    t.string   "delo_pages"
    t.string   "attach"
    t.integer  "user_id"
    t.integer  "execution_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "outgoings", ["execution_id"], :name => "index_outgoings_on_execution_id"
  add_index "outgoings", ["user_id"], :name => "index_outgoings_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "username"
    t.boolean  "admin",                  :default => false
    t.boolean  "activated",              :default => false
    t.string   "fullname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
