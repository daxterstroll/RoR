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

ActiveRecord::Schema.define(version: 20180529211504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date     "started_at"
    t.date     "ended_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "item_id"
    t.integer  "user_id"
  end

  add_index "bookings", ["item_id"], name: "index_bookings_on_item_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree

  create_table "category_fields", force: :cascade do |t|
    t.string   "filter"
    t.string   "value"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_fields", ["category_id"], name: "index_category_fields_on_category_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "filters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "filters_values", force: :cascade do |t|
    t.string   "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "filter_id"
  end

  add_index "filters_values", ["filter_id"], name: "index_filters_values_on_filter_id", using: :btree

  create_table "filters_values_items", id: false, force: :cascade do |t|
    t.integer "filters_value_id", null: false
    t.integer "item_id",          null: false
  end

  add_index "filters_values_items", ["filters_value_id", "item_id"], name: "index_filters_values_items_on_filters_value_id_and_item_id", using: :btree
  add_index "filters_values_items", ["item_id", "filters_value_id"], name: "index_filters_values_items_on_item_id_and_filters_value_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "category_id"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "reviewable_type"
    t.integer  "reviewable_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
    t.string   "message",         limit: 150
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "city_id"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree

  add_foreign_key "bookings", "items"
  add_foreign_key "bookings", "users"
  add_foreign_key "category_fields", "categories"
  add_foreign_key "filters_values", "filters"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "users", "cities"
end
