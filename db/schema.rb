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


ActiveRecord::Schema.define(version: 20140325235928) do

  create_table "apiattrs", force: true do |t|
    t.integer "api_id"
    t.string  "attribute"
  end

  create_table "apis", force: true do |t|
    t.string "name"
    t.string "maindiv"
    t.string "url"
  end

  create_table "authentications", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blockedips", force: true do |t|
    t.string  "ip"
    t.integer "apiid"
  end

  create_table "dailyips", force: true do |t|
    t.integer  "topip_id"
    t.datetime "day"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dailyrequests", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.float    "value"
    t.integer  "type_id"
    t.datetime "rdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hourlyips", force: true do |t|
    t.integer  "topip_id"
    t.integer  "hour"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hourrequests", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.float    "value"
    t.integer  "type_id"
    t.datetime "rdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iptypes", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.float    "value"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.integer "topip_id"
    t.string  "url"
    t.integer "freq"
    t.integer "type_id"
  end

  create_table "requesttypes", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.float    "value"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigmamus", force: true do |t|
    t.integer  "topip_id"
    t.float    "sigma"
    t.float    "mu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timerequests", force: true do |t|
    t.integer  "topip_id"
    t.datetime "request_time"
  end

  create_table "topips", force: true do |t|
    t.integer  "company_id"
    t.string   "title"
    t.string   "ipaddress"
    t.integer  "request"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "company"
    t.integer  "authentication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visitnumbers", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.float    "value"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
