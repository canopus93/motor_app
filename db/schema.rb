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

ActiveRecord::Schema.define(version: 20161007101436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "garages", force: :cascade do |t|
    t.integer  "people_id"
    t.integer  "motors_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["motors_id"], name: "index_garages_on_motors_id", using: :btree
    t.index ["people_id"], name: "index_garages_on_people_id", using: :btree
  end

  create_table "motors", force: :cascade do |t|
    t.string   "name",                                  null: false
    t.decimal  "velocity",     precision: 20, scale: 3, null: false
    t.decimal  "current_fuel", precision: 20, scale: 3, null: false
    t.decimal  "max_fuel",     precision: 20, scale: 3, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name",                                null: false
    t.decimal  "money",      precision: 20, scale: 3, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_foreign_key "garages", "motors", column: "motors_id"
  add_foreign_key "garages", "people", column: "people_id"
end
