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

ActiveRecord::Schema.define(version: 2018_11_15_181035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additions", comment: "Справочник дополнений (услуг и снаряжения)", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.boolean "service", default: true
    t.decimal "price", default: "0.0"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", comment: "Справочник адресов", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.boolean "verified", default: false
    t.bigint "country_id"
    t.bigint "region_id"
    t.bigint "district_id"
    t.bigint "settlement_id"
    t.string "postcode"
    t.string "street"
    t.string "house"
    t.string "flat"
    t.string "address1"
    t.string "address2"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_addresses_on_country_id"
    t.index ["district_id"], name: "index_addresses_on_district_id"
    t.index ["region_id"], name: "index_addresses_on_region_id"
    t.index ["settlement_id"], name: "index_addresses_on_settlement_id"
  end

  create_table "body_types", comment: "Справочник типов кузовов автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", comment: "Справочник марок автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", comment: "Справочник клиентов", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.boolean "verified", default: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "gender"
    t.date "birthday"
    t.string "phone"
    t.bigint "address_id"
    t.bigint "passport_id"
    t.bigint "driver_license_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_clients_on_address_id"
    t.index ["driver_license_id"], name: "index_clients_on_driver_license_id"
    t.index ["passport_id"], name: "index_clients_on_passport_id"
  end

  create_table "countries", comment: "Справочник стран", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "day_ranges", comment: "Справочник диапазонов дней аренды", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.integer "day_from"
    t.integer "day_to"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", comment: "Справочник административных районов", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.bigint "region_id"
    t.bigint "country_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_districts_on_country_id"
    t.index ["region_id"], name: "index_districts_on_region_id"
  end

  create_table "driver_licenses", comment: "Справчник водительских прав", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.boolean "verified", default: false
    t.bigint "country_id"
    t.string "serial"
    t.string "number"
    t.string "category"
    t.string "issued_by"
    t.string "issued_code"
    t.date "issued_date"
    t.date "valid_to"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_driver_licenses_on_country_id"
  end

  create_table "manufactures", comment: "Справочник производителей автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
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
    t.boolean "active", default: true
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", comment: "Справочник моделей автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.bigint "model_class_id"
    t.bigint "brand_id"
    t.bigint "manufacture_id"
    t.bigint "body_type_id"
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

  create_table "order_addons", comment: "Справочник дополнений для каждого заказа", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.bigint "order_id"
    t.bigint "addition_id"
    t.decimal "price"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addition_id"], name: "index_order_addons_on_addition_id"
    t.index ["order_id"], name: "index_order_addons_on_order_id"
  end

  create_table "orders", comment: "Справочник заказов", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.string "status", default: "created", comment: "состояние заказа"
    t.bigint "vehicle_id", comment: "конкретный автомобиль (может не быть)"
    t.bigint "model_id", comment: "модель (если есть конкретный автомобиль то модель берем оттуда)"
    t.bigint "client_id", comment: "клиент"
    t.bigint "issue_spot_id", comment: "точка выдачи"
    t.bigint "return_spot_id", comment: "точка возврата"
    t.date "date_from", comment: "дата выдачи"
    t.time "time_from", comment: "время выдачи"
    t.date "date_to", comment: "дата возврата"
    t.time "time_to", comment: "время возврата"
    t.integer "days_count", comment: "кол-во дней аренды (наверно тех что не попали в другие тарифы)"
    t.integer "days_over", comment: "кол-во просроченных дней"
    t.bigint "rental_plan_id", comment: "тарифный план"
    t.bigint "pay_type_id", comment: "форма оплаты"
    t.decimal "weekend_fee", comment: "плата по тарифу выходных дней"
    t.decimal "workweek_fee", comment: "плата по тарифу рабочей недели"
    t.decimal "days_fee", comment: "плата по тарифу по дням"
    t.decimal "addons_fee", comment: "плата за дополнительные услуги/снаряжение"
    t.decimal "forfeit_fee", comment: "штрафы"
    t.decimal "discouts", comment: "скидки"
    t.decimal "total_fee", comment: "общая сумма к оплате"
    t.decimal "total_paid", comment: "сколько уже оплачено от общей суммы (может быть частично/залог)"
    t.boolean "paid_full", default: false, comment: "отметка о полной оплате"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["issue_spot_id"], name: "index_orders_on_issue_spot_id"
    t.index ["model_id"], name: "index_orders_on_model_id"
    t.index ["pay_type_id"], name: "index_orders_on_pay_type_id"
    t.index ["rental_plan_id"], name: "index_orders_on_rental_plan_id"
    t.index ["return_spot_id"], name: "index_orders_on_return_spot_id"
    t.index ["vehicle_id"], name: "index_orders_on_vehicle_id"
  end

  create_table "passports", comment: "Справочник паспортов", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.boolean "verified", default: false
    t.bigint "country_id"
    t.string "serial"
    t.string "number"
    t.string "issued_by"
    t.string "issued_code"
    t.date "issued_date"
    t.date "valid_to"
    t.bigint "address_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_passports_on_address_id"
    t.index ["country_id"], name: "index_passports_on_country_id"
  end

  create_table "pay_types", comment: "Справочник форм оплаты", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.float "tax", default: 0.0, comment: "коэффициент налога"
    t.float "rebate", default: 0.0, comment: "коэффициент льготы"
    t.float "discount", default: 0.0, comment: "коэффициент скидки"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "range_rates", comment: "Связка коэффициентов и диапазонов дней", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.bigint "rental_rate_id"
    t.bigint "day_range_id"
    t.float "rate"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_range_id"], name: "index_range_rates_on_day_range_id"
    t.index ["rental_rate_id"], name: "index_range_rates_on_rental_rate_id"
  end

  create_table "regions", comment: "Справочник регионов (республика/край/область/округ)", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.bigint "country_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "rental_plans", comment: "Справочник тарифных планов", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
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
    t.boolean "active", default: true
    t.bigint "model_id"
    t.bigint "model_class_id"
    t.decimal "hour"
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
    t.boolean "active", default: true
    t.bigint "model_class_id"
    t.bigint "rental_type_id"
    t.float "hour"
    t.float "day"
    t.float "workweek"
    t.float "weekend"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_class_id"], name: "index_rental_rates_on_model_class_id"
    t.index ["rental_type_id"], name: "index_rental_rates_on_rental_type_id"
  end

  create_table "rental_types", comment: "Справочник типов тарифных планов", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settlements", comment: "Справочник населенных пунктов (город/деревня/село)", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.bigint "status_id"
    t.bigint "district_id"
    t.bigint "region_id"
    t.bigint "country_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_settlements_on_country_id"
    t.index ["district_id"], name: "index_settlements_on_district_id"
    t.index ["region_id"], name: "index_settlements_on_region_id"
    t.index ["status_id"], name: "index_settlements_on_status_id"
  end

  create_table "spots", comment: "Справочник точек выдачи/возврата", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.bigint "address_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_spots_on_address_id"
  end

  create_table "statuses", comment: "Справочник статусов нас.пунктов (город, село, деревня...)", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trunk_types", comment: "Справочник типов багажников автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trunks", comment: "Справочник багажников автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.bigint "model_id"
    t.bigint "trunk_type_id"
    t.decimal "price"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_trunks_on_model_id"
    t.index ["trunk_type_id"], name: "index_trunks_on_trunk_type_id"
  end

  create_table "users", comment: "Справочник пользователей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.boolean "verified", default: false
    t.string "secret"
    t.string "role", default: "user"
    t.string "email"
    t.string "image"
    t.bigint "client_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_users_on_client_id"
  end

  create_table "vehicles", comment: "Справочник автомобилей", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "active", default: true
    t.bigint "model_id"
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

  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "districts"
  add_foreign_key "addresses", "regions"
  add_foreign_key "addresses", "settlements"
  add_foreign_key "clients", "addresses"
  add_foreign_key "clients", "driver_licenses"
  add_foreign_key "clients", "passports"
  add_foreign_key "districts", "countries"
  add_foreign_key "districts", "regions"
  add_foreign_key "driver_licenses", "countries"
  add_foreign_key "manufactures", "brands"
  add_foreign_key "manufactures", "countries"
  add_foreign_key "models", "body_types"
  add_foreign_key "models", "brands"
  add_foreign_key "models", "manufactures"
  add_foreign_key "order_addons", "additions"
  add_foreign_key "order_addons", "orders"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "models"
  add_foreign_key "orders", "pay_types"
  add_foreign_key "orders", "rental_plans"
  add_foreign_key "orders", "spots", column: "issue_spot_id"
  add_foreign_key "orders", "spots", column: "return_spot_id"
  add_foreign_key "orders", "vehicles"
  add_foreign_key "passports", "addresses"
  add_foreign_key "passports", "countries"
  add_foreign_key "range_rates", "day_ranges"
  add_foreign_key "range_rates", "rental_rates"
  add_foreign_key "regions", "countries"
  add_foreign_key "rental_plans", "model_classes"
  add_foreign_key "rental_plans", "models"
  add_foreign_key "rental_plans", "rental_prices"
  add_foreign_key "rental_plans", "rental_rates"
  add_foreign_key "rental_plans", "rental_types"
  add_foreign_key "rental_prices", "model_classes"
  add_foreign_key "rental_prices", "models"
  add_foreign_key "rental_rates", "model_classes"
  add_foreign_key "rental_rates", "rental_types"
  add_foreign_key "settlements", "countries"
  add_foreign_key "settlements", "districts"
  add_foreign_key "settlements", "regions"
  add_foreign_key "settlements", "statuses"
  add_foreign_key "spots", "addresses"
  add_foreign_key "trunks", "models"
  add_foreign_key "trunks", "trunk_types"
  add_foreign_key "users", "clients"
  add_foreign_key "vehicles", "models"
  add_foreign_key "vehicles", "trunks"
end
