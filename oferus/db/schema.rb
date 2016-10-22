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

ActiveRecord::Schema.define(version: 20161022050129) do

  create_table "client_reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "client_unique_number", limit: 255
    t.string   "client_rut",           limit: 255
    t.string   "client_name1",         limit: 255
    t.string   "client_name2",         limit: 255
    t.string   "client_address1",      limit: 255
    t.string   "client_address2",      limit: 255
    t.string   "client_city",          limit: 255
    t.string   "client_phone",         limit: 255
    t.string   "client_fax",           limit: 255
    t.string   "client_cell_phone",    limit: 255
    t.string   "client_web_site",      limit: 255
    t.string   "domain",               limit: 255
    t.string   "client_type1",         limit: 255
    t.string   "client_type2",         limit: 255
  end

  create_table "comunes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_brands", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "product_name1",               limit: 255
    t.string   "product_name2",               limit: 255
    t.string   "product_name3",               limit: 255
    t.string   "product_unit_of_measurement", limit: 255
    t.string   "product_stock_keeping_unit",  limit: 255
    t.string   "product_line",                limit: 255
    t.string   "product_group",               limit: 255
    t.string   "product_type",                limit: 255
    t.string   "product_cellar_location",     limit: 255
    t.decimal  "product_normal_price",                    precision: 10
    t.string   "product_branch_office",       limit: 255
    t.decimal  "product_stock",                           precision: 10
    t.string   "domain",                      limit: 255
    t.string   "product_identifier",          limit: 255
    t.decimal  "product_minimum_price",                   precision: 10
  end

  create_table "quotations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_flows", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_notes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
