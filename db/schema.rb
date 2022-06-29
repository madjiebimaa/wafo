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

ActiveRecord::Schema[7.0].define(version: 2022_06_29_043342) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname"
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_carts_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname"
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.bigint "merchant_id"
    t.string "name", null: false
    t.text "description"
    t.integer "price", null: false
    t.integer "stock", null: false
    t.text "image_url"
    t.datetime "served_at", null: false
    t.datetime "expired_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_items_on_merchant_id"
    t.index ["name"], name: "index_items_on_name"
    t.index ["price"], name: "index_items_on_price"
    t.index ["stock"], name: "index_items_on_stock"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "long", precision: 15, scale: 10
    t.index ["lat"], name: "index_merchants_on_lat"
    t.index ["long"], name: "index_merchants_on_long"
    t.index ["name"], name: "index_merchants_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role_type"
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["role_type", "role_id"], name: "index_users_on_role"
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "items", "merchants"
end
