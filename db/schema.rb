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

ActiveRecord::Schema.define(version: 20190102064056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_contact_call_histories", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "user_id",                                           null: false
    t.integer  "user_contact_id",                                   null: false
    t.jsonb    "other_details",   default: []
    t.string   "created_by",      default: "system@truecaller.com", null: false
    t.string   "updated_by",      default: "system@truecaller.com", null: false
    t.boolean  "is_active",       default: true
    t.datetime "deleted_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["created_at"], name: "index_user_contact_call_histories_on_created_at", using: :btree
    t.index ["is_active", "user_id", "start_time", "end_time"], name: "call_histories_search_index", using: :btree
    t.index ["is_active"], name: "index_user_contact_call_histories_on_is_active", using: :btree
  end

  create_table "user_contacts", force: :cascade do |t|
    t.integer  "user_id",                                         null: false
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.jsonb    "other_details", default: []
    t.string   "created_by",    default: "system@truecaller.com", null: false
    t.string   "updated_by",    default: "system@truecaller.com", null: false
    t.boolean  "is_active",     default: true
    t.datetime "deleted_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["email"], name: "index_user_contacts_on_email", using: :btree
    t.index ["is_active"], name: "index_user_contacts_on_is_active", using: :btree
    t.index ["name"], name: "index_user_contacts_on_name", using: :btree
    t.index ["phone"], name: "index_user_contacts_on_phone", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.jsonb    "other_details", default: []
    t.string   "created_by",    default: "system@truecaller.com", null: false
    t.string   "updated_by",    default: "system@truecaller.com", null: false
    t.boolean  "is_active",     default: true
    t.datetime "deleted_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["created_at"], name: "index_users_on_created_at", using: :btree
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["is_active"], name: "index_users_on_is_active", using: :btree
    t.index ["name"], name: "index_users_on_name", using: :btree
    t.index ["phone"], name: "index_users_on_phone", using: :btree
  end

  add_foreign_key "user_contact_call_histories", "user_contacts"
  add_foreign_key "user_contact_call_histories", "users"
  add_foreign_key "user_contacts", "users"
end
