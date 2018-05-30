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

ActiveRecord::Schema.define(version: 20180530183904) do

  create_table "crossings", force: :cascade do |t|
    t.string  "name"
    t.boolean "has_toll"
    t.integer "start_location_id"
    t.integer "end_location_id"
    t.integer "structure_id"
  end

  create_table "ez_passes", force: :cascade do |t|
    t.float "balance"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
  end

  create_table "structures", force: :cascade do |t|
    t.string "name"
    t.float  "toll_amount"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "e_z_pass_id"
    t.integer "crossing_id"
  end

end
