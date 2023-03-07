# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_07_152616) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hikes", force: :cascade do |t|
    t.string "hike_name"
    t.text "hike_description"
    t.string "hike_photo_url"
    t.string "difficulty"
    t.float "distance"
    t.interval "duration"
    t.integer "max_people"
    t.date "hike_date"
    t.boolean "hike_confirmed", default: false
    t.boolean "hike_completed", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "starting_point"
    t.index ["user_id"], name: "index_hikes_on_user_id"
  end

  create_table "markers", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.integer "order"
    t.bigint "hike_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hike_id"], name: "index_markers_on_hike_id"
  end

  create_table "requests", force: :cascade do |t|
    t.boolean "request_accepted", default: false
    t.boolean "request_pending", default: true
    t.bigint "user_id"
    t.bigint "hike_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hike_id"], name: "index_requests_on_hike_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "user_photo_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "hikes", "users"
  add_foreign_key "markers", "hikes"
  add_foreign_key "requests", "hikes"
  add_foreign_key "requests", "users"
end
