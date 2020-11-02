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

ActiveRecord::Schema.define(version: 2020_10_29_220317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "live_stream_attendees", force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.bigint "user_id", null: false
    t.index ["topic_id"], name: "index_live_stream_attendees_on_topic_id"
    t.index ["user_id"], name: "index_live_stream_attendees_on_user_id"
  end

  create_table "live_streams", force: :cascade do |t|
    t.datetime "start_date_time"
    t.bigint "topic_id", null: false
    t.index ["topic_id"], name: "index_live_streams_on_topic_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "topic_id", null: false
    t.string "description"
    t.decimal "price", precision: 8, scale: 2
    t.datetime "date"
    t.index ["topic_id"], name: "index_responses_on_topic_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "description"
    t.string "questions"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.bigint "user_id", null: false
    t.integer "count"
    t.index ["topic_id"], name: "index_votes_on_topic_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "live_stream_attendees", "topics"
  add_foreign_key "live_stream_attendees", "users"
  add_foreign_key "live_streams", "topics"
  add_foreign_key "responses", "topics"
  add_foreign_key "responses", "users"
  add_foreign_key "topics", "users"
  add_foreign_key "votes", "topics"
  add_foreign_key "votes", "users"
end
