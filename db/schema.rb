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

ActiveRecord::Schema.define(version: 2019_09_10_033854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "event_reminders", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "trigger_at"
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_reminders_on_event_id"
    t.index ["user_id"], name: "index_event_reminders_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "starts_at"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_events_on_location_id"
  end

  create_table "invites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_invites_on_event_id"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_items_on_event_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address_line_one"
    t.string "address_line_two"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "phones", force: :cascade do |t|
    t.string "phone_number"
    t.boolean "is_primary"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phones_on_user_id"
  end

  create_table "sms_messages", force: :cascade do |t|
    t.text "text"
    t.bigint "phone_id"
    t.datetime "sent_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone_id"], name: "index_sms_messages_on_phone_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "event_reminders", "events"
  add_foreign_key "event_reminders", "users"
  add_foreign_key "events", "locations"
  add_foreign_key "invites", "events"
  add_foreign_key "invites", "users"
  add_foreign_key "items", "events"
  add_foreign_key "items", "users"
  add_foreign_key "phones", "users"
  add_foreign_key "sms_messages", "phones"
end
