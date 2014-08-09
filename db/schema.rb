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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140809194807) do

  create_table "alerts", force: true do |t|
    t.time     "start"
    t.time     "end"
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.text     "sms"
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "last_sent"
    t.string   "service_name"
    t.string   "last_alert_status"
  end

  add_index "alerts", ["recipient_id"], name: "index_alerts_on_recipient_id"
  add_index "alerts", ["user_id"], name: "index_alerts_on_user_id"

  create_table "recipients", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email_address"
    t.text     "email_template"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "traffic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "more_detail"
    t.text     "description"
  end

  add_index "services", ["name"], name: "index_services_on_name"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "phone_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
