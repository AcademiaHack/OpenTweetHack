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

ActiveRecord::Schema.define(version: 20160511140556) do

  create_table "follows", force: :cascade do |t|
    t.integer  "target_user_id", limit: 4
    t.integer  "source_user_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "follows", ["source_user_id"], name: "index_follows_on_source_user_id", using: :btree
  add_index "follows", ["target_user_id"], name: "index_follows_on_target_user_id", using: :btree

  create_table "tweets", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tweets", ["user_id"], name: "index_tweets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "nick_name",  limit: 255
    t.string   "password",   limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "age",        limit: 4
  end

  add_foreign_key "follows", "users", column: "source_user_id"
  add_foreign_key "follows", "users", column: "target_user_id"
  add_foreign_key "tweets", "users"
end
