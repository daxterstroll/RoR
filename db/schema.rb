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

ActiveRecord::Schema.define(version: 20180512205725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_histories", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "credit_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "account_histories", ["account_id"], name: "index_account_histories_on_account_id", using: :btree

  create_table "accounts", force: :cascade do |t|
    t.integer  "supplier_id"
    t.string   "account_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["supplier_id"], name: "index_accounts_on_supplier_id", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.date     "started_at"
    t.date     "ended_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bookings", ["item_id"], name: "fki_item_id_fkey", using: :btree
  add_index "bookings", ["user_id"], name: "fki_user_id_fkey", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["user_id"], name: "fki_items_fkey", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "message"
    t.integer  "reviewable_id"
    t.text     "reviewable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "reviews", ["reviewable_id"], name: "fki_reviewable_id_fkey", using: :btree
  add_index "reviews", ["user_id"], name: "fki_users_fkey", using: :btree

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "city_id"
  end

  add_index "users", ["city_id"], name: "fki_city_id_fkey", using: :btree

  add_foreign_key "bookings", "items", name: "item_id_fkey"
  add_foreign_key "bookings", "users", name: "user_id_fkey"
  add_foreign_key "items", "users", name: "user_id_fkey"
  add_foreign_key "reviews", "items", column: "reviewable_id", name: "reviewable_id_fkey"
  add_foreign_key "reviews", "users", column: "reviewable_id", name: "reviewable_id_fkey1"
  add_foreign_key "reviews", "users", name: "user_id_fkey"
  add_foreign_key "users", "cities", name: "city_id_fkey"
end
