# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_19_193129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friend_groups", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_friend_groups_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.string "approved", default: "Pending"
    t.boolean "close_friend", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receiver_id"], name: "index_friendships_on_receiver_id"
    t.index ["sender_id"], name: "index_friendships_on_sender_id"
  end

  create_table "group_members", force: :cascade do |t|
    t.bigint "friend_group_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend_group_id"], name: "index_group_members_on_friend_group_id"
    t.index ["user_id"], name: "index_group_members_on_user_id"
  end

  create_table "hangout_chats", force: :cascade do |t|
    t.bigint "hangout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hangout_id"], name: "index_hangout_chats_on_hangout_id"
  end

  create_table "hangout_invitees", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "hangout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hangout_id"], name: "index_hangout_invitees_on_hangout_id"
    t.index ["user_id"], name: "index_hangout_invitees_on_user_id"
  end

  create_table "hangout_messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "hangout_chat_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hangout_chat_id"], name: "index_hangout_messages_on_hangout_chat_id"
    t.index ["user_id"], name: "index_hangout_messages_on_user_id"
  end

  create_table "hangouts", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "category"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_hangouts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "username"
    t.boolean "availability", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friend_groups", "users"
  add_foreign_key "friendships", "users", column: "receiver_id"
  add_foreign_key "friendships", "users", column: "sender_id"
  add_foreign_key "group_members", "friend_groups"
  add_foreign_key "group_members", "users"
  add_foreign_key "hangout_chats", "hangouts"
  add_foreign_key "hangout_invitees", "hangouts"
  add_foreign_key "hangout_invitees", "users"
  add_foreign_key "hangout_messages", "hangout_chats"
  add_foreign_key "hangout_messages", "users"
  add_foreign_key "hangouts", "users"
end
