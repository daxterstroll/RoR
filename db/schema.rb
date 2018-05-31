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

ActiveRecord::Schema.define(version: 20180531170337) do

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
    t.string "name"
    t.string "ancestry"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree

  create_table "categories_filters", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "filter_id",   null: false
  end

  add_index "categories_filters", ["category_id", "filter_id"], name: "index_categories_filters_on_category_id_and_filter_id", using: :btree
  add_index "categories_filters", ["filter_id", "category_id"], name: "index_categories_filters_on_filter_id_and_category_id", using: :btree

  create_table "category_fields", force: :cascade do |t|
    t.string  "filter"
    t.string  "value"
    t.integer "category_id"
  end

  add_index "category_fields", ["category_id"], name: "index_category_fields_on_category_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "filters", force: :cascade do |t|
    t.string "name"
  end

  create_table "filters_values", force: :cascade do |t|
    t.string  "option"
    t.integer "filter_id"
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
    t.string   "message"
    t.string   "reviewable_type"
    t.integer  "reviewable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  add_index "reviews", ["reviewable_id"], name: "index_reviews_on_reviewable_id", using: :btree
  add_index "reviews", ["reviewable_type"], name: "index_reviews_on_reviewable_type", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "searches", force: :cascade do |t|
    t.string   "keywords"
    t.integer  "category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "filters_value_id"
  end

  add_index "searches", ["category_id"], name: "index_searches_on_category_id", using: :btree
  add_index "searches", ["filters_value_id"], name: "index_searches_on_filters_value_id", using: :btree

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
  add_foreign_key "searches", "categories"
  add_foreign_key "searches", "filters_values"
  add_foreign_key "users", "cities"
end
