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

ActiveRecord::Schema.define(version: 2019_05_08_122539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "buyer_reviews", force: :cascade do |t|
    t.string "buyer_review_content"
    t.integer "rate_buyer"
    t.bigint "transaction_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "seller_id"
    t.bigint "buyer_id"
    t.index ["transaction_id"], name: "index_buyer_reviews_on_transaction_id"
    t.index ["user_id"], name: "index_buyer_reviews_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "item_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_reviews", force: :cascade do |t|
    t.string "item_review_content"
    t.float "rate_item"
    t.bigint "user_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_reviews_on_item_id"
    t.index ["user_id"], name: "index_item_reviews_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.string "version"
    t.string "release_year"
    t.string "name"
    t.string "description"
    t.float "price"
    t.string "condition"
    t.integer "number_in_stock"
    t.boolean "in_stock"
    t.string "serial_number"
    t.string "item_location"
    t.boolean "pick_up"
    t.boolean "delivery"
    t.bigint "category_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "seller_reviews", force: :cascade do |t|
    t.string "seller_review_content"
    t.integer "rate_seller"
    t.bigint "transaction_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "seller_id"
    t.bigint "buyer_id"
    t.index ["transaction_id"], name: "index_seller_reviews_on_transaction_id"
    t.index ["user_id"], name: "index_seller_reviews_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.float "total"
    t.string "payment_reference"
    t.boolean "pick_up"
    t.boolean "delivery"
    t.string "pick_up_address"
    t.string "delivery_address"
    t.bigint "seller_id"
    t.bigint "buyer_id"
    t.bigint "item_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_in_cents"
    t.index ["item_id"], name: "index_transactions_on_item_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "first_name"
    t.string "last_name"
    t.string "user_billing_address_street"
    t.string "user_billing_address_suburb"
    t.string "user_billing_address_state"
    t.string "user_billing_address_postcode"
    t.string "user_billing_address_country"
    t.string "user_postal_address_street"
    t.string "user_postal_address_suburb"
    t.string "user_postal_address_state"
    t.string "user_postal_address_postcode"
    t.string "user_postal_address_country"
    t.string "user_contact_tel_number"
    t.string "username"
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.string "stripe_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "buyer_reviews", "transactions"
  add_foreign_key "buyer_reviews", "users"
  add_foreign_key "item_reviews", "items"
  add_foreign_key "item_reviews", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
  add_foreign_key "seller_reviews", "transactions"
  add_foreign_key "seller_reviews", "users"
  add_foreign_key "transactions", "items"
  add_foreign_key "transactions", "users"
end
