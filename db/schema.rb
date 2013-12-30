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

ActiveRecord::Schema.define(version: 20131230133716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "schemes", force: true do |t|
    t.boolean  "had_direct_interactions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo"
    t.string   "location_ids",            default: [], array: true
    t.string   "sector_ids",              default: [], array: true
    t.string   "activity_ids",            default: [], array: true
    t.string   "age_range_ids",           default: [], array: true
    t.string   "commitment_length_ids",   default: [], array: true
    t.string   "company_size_ids",        default: [], array: true
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "name"
    t.string   "website"
    t.string   "description"
  end

  add_index "schemes", ["activity_ids"], name: "index_schemes_on_activity_ids", using: :gin
  add_index "schemes", ["age_range_ids"], name: "index_schemes_on_age_range_ids", using: :gin
  add_index "schemes", ["commitment_length_ids"], name: "index_schemes_on_commitment_length_ids", using: :gin
  add_index "schemes", ["company_size_ids"], name: "index_schemes_on_company_size_ids", using: :gin
  add_index "schemes", ["location_ids"], name: "index_schemes_on_location_ids", using: :gin
  add_index "schemes", ["name"], name: "index_schemes_on_name", unique: true, using: :btree
  add_index "schemes", ["sector_ids"], name: "index_schemes_on_sector_ids", using: :gin

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
