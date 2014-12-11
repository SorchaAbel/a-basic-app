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

ActiveRecord::Schema.define(version: 20141105103023) do

  create_table "Administrators", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                      default: "", null: false
    t.string   "salt"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",        limit: 25
  end

  add_index "administrators", ["username"], name: "index_Administrators_on_username", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",           default: "", null: false
    t.string   "salt"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.date     "dob"
    t.string   "location"
    t.string   "comment",    limit: 500
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
  end

  create_table "results", force: true do |t|
    t.integer  "student_id"
    t.integer  "term_id"
    t.float    "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["student_id", "term_id"], name: "index_results_on_student_id_and_term_id", using: :btree

  create_table "students", force: true do |t|
    t.string   "name"
    t.date     "dob"
    t.string   "addr1",      limit: 25
    t.string   "addr2",      limit: 25
    t.string   "postcode",   limit: 10
    t.string   "email",      limit: 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", force: true do |t|
    t.integer  "year_term"
    t.integer  "year"
    t.integer  "student_id"
    t.float    "amt_paid"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "terms", ["student_id"], name: "index_terms_on_student_id", using: :btree

end
