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

ActiveRecord::Schema.define(version: 2021_02_20_222341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "stock_id", null: false
    t.bigint "user_id", null: false
    t.jsonb "fields"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_categories_on_stock_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.jsonb "field_values"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "spacs", force: :cascade do |t|
    t.string "ticker"
    t.string "name"
    t.string "target"
    t.date "definitive_agreement"
    t.date "preliminary_filing"
    t.date "first_revision"
    t.date "second_revision"
    t.date "third_revision"
    t.date "definitive_filing"
    t.date "merger_meeting"
    t.string "expected_close"
    t.string "investor_presentation_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stock_transactions", force: :cascade do |t|
    t.boolean "track", default: false
    t.boolean "following", default: false
    t.boolean "holding", default: false
    t.boolean "buying", default: false
    t.boolean "selling", default: false
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_stock_transactions_on_stock_id"
    t.index ["user_id"], name: "index_stock_transactions_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "ticker"
    t.string "name"
    t.integer "following", default: 0
    t.integer "holding", default: 0
    t.integer "buying", default: 0
    t.integer "selling", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.tsvector "searchable", default: -> { "to_tsvector('simple'::regconfig, (COALESCE(ticker, ''::character varying))::text)" }
    t.index ["searchable"], name: "index_stocks_on_searchable", using: :gin
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "provider"
    t.string "uid"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  end

  add_foreign_key "categories", "stocks"
  add_foreign_key "categories", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
  add_foreign_key "stock_transactions", "stocks"
  add_foreign_key "stock_transactions", "users"
end
