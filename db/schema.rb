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

ActiveRecord::Schema.define(version: 2021_07_03_142705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kingdom_builders", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "payment_mode"
    t.integer "amount_pledge"
    t.integer "total_amount_paid"
    t.integer "payment_mode_based_amount"
    t.string "status"
    t.string "entered_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pledge_type"
    t.bigint "parishes_id"
    t.bigint "areas_id"
    t.integer "zone"
    t.index ["areas_id"], name: "index_kingdom_builders_on_areas_id"
    t.index ["parishes_id"], name: "index_kingdom_builders_on_parishes_id"
  end

  create_table "kingdom_builders_payments", force: :cascade do |t|
    t.string "email"
    t.integer "amount_paid"
    t.string "entered_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parishes", force: :cascade do |t|
    t.string "name"
    t.bigint "areas_id"
    t.index ["areas_id"], name: "index_parishes_on_areas_id"
  end

  create_table "payment_bands", force: :cascade do |t|
    t.string "name"
    t.integer "conservative_value"
    t.integer "optimistic_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "token"
    t.datetime "expired_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
  end

  add_foreign_key "kingdom_builders", "areas", column: "areas_id"
  add_foreign_key "kingdom_builders", "parishes", column: "parishes_id"
  add_foreign_key "parishes", "areas", column: "areas_id"
end
