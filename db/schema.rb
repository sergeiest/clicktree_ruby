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

ActiveRecord::Schema.define(version: 20140221212158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: true do |t|
    t.string   "email"
    t.string   "password"
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

  create_table "requesttypes", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.float    "value"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
