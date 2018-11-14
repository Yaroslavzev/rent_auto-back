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

ActiveRecord::Schema.define(version: 2018_11_14_094457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additions", comment: "Справочник дополнительных услуг и снаряжения", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.boolean "service", default: true
    t.decimal "price", default: "0.0"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "body_types", comment: "Справочник типов кузовов автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", comment: "Справочник марок автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", comment: "Справочник стран", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "day_ranges", comment: "Справочник диапазонов дней аренды", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "day_from"
    t.integer "day_to"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "localities", comment: "Справочник населенных пунктов", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "status_id"
    t.bigint "region_id"
    t.bigint "state_id"
    t.bigint "country_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_localities_on_country_id"
    t.index ["region_id"], name: "index_localities_on_region_id"
    t.index ["state_id"], name: "index_localities_on_state_id"
    t.index ["status_id"], name: "index_localities_on_status_id"
  end

  create_table "manufactures", comment: "Справочник производителей автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "brand_id"
    t.bigint "country_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_manufactures_on_brand_id"
    t.index ["country_id"], name: "index_manufactures_on_country_id"
  end

  create_table "model_classes", comment: "Справочник классов моделей автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", comment: "Справочник моделей автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "model_class_id"
    t.bigint "brand_id"
    t.bigint "manufacture_id"
    t.bigint "body_type_id"
    t.boolean "active", default: true
    t.integer "door_count"
    t.integer "seat_count"
    t.string "style"
    t.string "transmission"
    t.string "drive_type"
    t.string "fuel_type"
    t.string "engine"
    t.float "engine_volume"
    t.string "specs", array: true
    t.string "options", array: true
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body_type_id"], name: "index_models_on_body_type_id"
    t.index ["brand_id"], name: "index_models_on_brand_id"
    t.index ["manufacture_id"], name: "index_models_on_manufacture_id"
    t.index ["model_class_id"], name: "index_models_on_model_class_id"
  end

  create_table "range_rates", comment: "Связка коэффициентов и диапазонов дней", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "rental_rate_id"
    t.bigint "day_range_id"
    t.float "rate"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_range_id"], name: "index_range_rates_on_day_range_id"
    t.index ["rental_rate_id"], name: "index_range_rates_on_rental_rate_id"
  end

  create_table "regions", comment: "Спраовчник областей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "state_id"
    t.bigint "country_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
    t.index ["state_id"], name: "index_regions_on_state_id"
  end

  create_table "rental_plans", comment: "Справочник тарифных планов", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "model_id"
    t.bigint "model_class_id"
    t.bigint "rental_type_id"
    t.bigint "rental_rate_id"
    t.bigint "rental_price_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_class_id"], name: "index_rental_plans_on_model_class_id"
    t.index ["model_id"], name: "index_rental_plans_on_model_id"
    t.index ["rental_price_id"], name: "index_rental_plans_on_rental_price_id"
    t.index ["rental_rate_id"], name: "index_rental_plans_on_rental_rate_id"
    t.index ["rental_type_id"], name: "index_rental_plans_on_rental_type_id"
  end

  create_table "rental_prices", comment: "Справчник базовых цен для моделей (классов?)", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "model_id"
    t.bigint "model_class_id"
    t.decimal "day"
    t.decimal "forfeit"
    t.decimal "earnest"
    t.decimal "km"
    t.decimal "km_over"
    t.decimal "weekend"
    t.decimal "workweek"
    t.decimal "workday"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_class_id"], name: "index_rental_prices_on_model_class_id"
    t.index ["model_id"], name: "index_rental_prices_on_model_id"
  end

  create_table "rental_rates", comment: "Справочник коэффициентов тарифов", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "model_id"
    t.bigint "rental_type_id"
    t.float "workweek"
    t.float "weekend"
    t.float "hour"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_rental_rates_on_model_id"
    t.index ["rental_type_id"], name: "index_rental_rates_on_rental_type_id"
  end

  create_table "rental_types", comment: "Справочник типов тарифных планов", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", comment: "Справочник округов", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "country_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "statuses", comment: "Справочник статусов нас.пунктов (город, село, деревня...)", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trunk_types", comment: "Справочник типов багажников автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trunks", comment: "Справочник багажников автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "model_id"
    t.bigint "trunk_type_id"
    t.decimal "price"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_trunks_on_model_id"
    t.index ["trunk_type_id"], name: "index_trunks_on_trunk_type_id"
  end

  create_table "vehicles", comment: "Справочник автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "model_id"
    t.boolean "active", default: true
    t.string "garage_no"
    t.string "state_no"
    t.string "vin"
    t.date "release"
    t.integer "mileage"
    t.string "color"
    t.string "specs", array: true
    t.string "options", array: true
    t.bigint "trunk_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_vehicles_on_model_id"
    t.index ["trunk_id"], name: "index_vehicles_on_trunk_id"
  end

  add_foreign_key "localities", "countries"
  add_foreign_key "localities", "regions"
  add_foreign_key "localities", "states"
  add_foreign_key "localities", "statuses"
  add_foreign_key "manufactures", "brands"
  add_foreign_key "manufactures", "countries"
  add_foreign_key "models", "body_types"
  add_foreign_key "models", "brands"
  add_foreign_key "models", "manufactures"
  add_foreign_key "range_rates", "day_ranges"
  add_foreign_key "range_rates", "rental_rates"
  add_foreign_key "regions", "countries"
  add_foreign_key "regions", "states"
  add_foreign_key "rental_plans", "model_classes"
  add_foreign_key "rental_plans", "models"
  add_foreign_key "rental_plans", "rental_prices"
  add_foreign_key "rental_plans", "rental_rates"
  add_foreign_key "rental_plans", "rental_types"
  add_foreign_key "rental_prices", "model_classes"
  add_foreign_key "rental_prices", "models"
  add_foreign_key "rental_rates", "models"
  add_foreign_key "rental_rates", "rental_types"
  add_foreign_key "states", "countries"
  add_foreign_key "trunks", "models"
  add_foreign_key "trunks", "trunk_types"
  add_foreign_key "vehicles", "models"
  add_foreign_key "vehicles", "trunks"
end
