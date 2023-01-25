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

ActiveRecord::Schema[7.0].define(version: 2023_01_25_135202) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_queries", id: false, force: :cascade do |t|
    t.integer "query_id", null: false
    t.integer "category_id", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "content"
    t.integer "query_id", null: false
    t.boolean "preferred"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["query_id"], name: "index_options_on_query_id"
  end

  create_table "options_queries", id: false, force: :cascade do |t|
    t.integer "query_id", null: false
    t.integer "option_id", null: false
  end

  create_table "queries", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "situation"
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_queries_on_category_id"
  end

  create_table "query_options", force: :cascade do |t|
    t.integer "query_id", null: false
    t.integer "option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_query_options_on_option_id"
    t.index ["query_id"], name: "index_query_options_on_query_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "options", "queries"
  add_foreign_key "queries", "categories"
  add_foreign_key "query_options", "options"
  add_foreign_key "query_options", "queries"
end
