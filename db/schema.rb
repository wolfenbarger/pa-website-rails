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

ActiveRecord::Schema.define(version: 20150920202124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "QuizDescriptors", force: :cascade do |t|
    t.jsonb    "descriptor"
    t.string   "title",         limit: 255, default: ""
    t.boolean  "hidden",                    default: false
    t.boolean  "published",                 default: false
    t.datetime "createdAt",                                 null: false
    t.datetime "updatedAt",                                 null: false
    t.integer  "UserAwesomeId"
  end

# Could not dump table "Users" because of following StandardError
#   Unknown type '"enum_Users_role"' for column 'role'

  create_table "tickets", force: :cascade do |t|
    t.string   "name"
    t.string   "seat_id_seq"
    t.text     "address"
    t.decimal  "price_paid"
    t.string   "email_address"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "phone"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "QuizDescriptors", "\"Users\"", column: "UserAwesomeId", primary_key: "awesome_id", name: "QuizDescriptors_UserAwesomeId_fkey", on_update: :cascade, on_delete: :nullify
end
