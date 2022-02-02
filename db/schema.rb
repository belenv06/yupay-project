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

ActiveRecord::Schema.define(version: 2022_02_02_175632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "list_orders", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_list_orders_on_order_id"
    t.index ["product_id"], name: "index_list_orders_on_product_id"
  end

  create_table "list_purchases", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "product_id", null: false
    t.bigint "purchase_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_list_purchases_on_product_id"
    t.index ["purchase_id"], name: "index_list_purchases_on_purchase_id"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "status"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "size"
    t.float "price"
    t.integer "stock"
    t.string "bar_code"
    t.integer "minimum_required"
    t.float "cost"
    t.boolean "visible", default: true
    t.bigint "warehouse_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["warehouse_id"], name: "index_products_on_warehouse_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.boolean "status"
    t.bigint "supplier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["supplier_id"], name: "index_purchases_on_supplier_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_warehouses_on_user_id"
  end

  add_foreign_key "list_orders", "orders"
  add_foreign_key "list_orders", "products"
  add_foreign_key "list_purchases", "products"
  add_foreign_key "list_purchases", "purchases"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "warehouses"
  add_foreign_key "purchases", "suppliers"
  add_foreign_key "purchases", "users"
  add_foreign_key "warehouses", "users"
end
