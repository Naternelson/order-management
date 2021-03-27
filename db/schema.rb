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

ActiveRecord::Schema.define(version: 2021_03_27_223721) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.float "amount"
    t.string "amount_unit_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "sales_order_id"
    t.string "purchase_order_id"
    t.datetime "received_on"
    t.datetime "due_by"
    t.string "status"
    t.integer "priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "customer_id"
  end

  create_table "product_materials", force: :cascade do |t|
    t.integer "product_id"
    t.integer "material_id"
    t.float "amount"
    t.string "amount_unit_type"
    t.string "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "color"
    t.float "length"
    t.float "width"
    t.float "height"
    t.string "dimension_unit_type"
    t.float "weight"
    t.string "weight_unit_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
