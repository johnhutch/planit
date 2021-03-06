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

ActiveRecord::Schema.define(version: 20151108230827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "other"
    t.integer  "choice_id"
    t.integer  "response_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "choices", force: :cascade do |t|
    t.integer  "particular_id"
    t.string   "answer"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "particulars", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.integer  "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "question"
  end

  create_table "people", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people_plans", id: false, force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "plan_id",   null: false
  end

  create_table "plans", force: :cascade do |t|
    t.integer  "planner_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "title"
    t.string   "planner_token_id"
    t.boolean  "is_finalized",     default: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.integer  "person_id",                        null: false
    t.integer  "plan_id",                          null: false
    t.boolean  "is_planner_token", default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
