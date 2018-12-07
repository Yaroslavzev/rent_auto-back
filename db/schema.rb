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

ActiveRecord::Schema.define(version: 2018_11_22_085947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additions", comment: "Справочник дополнений (услуг и снаряжения)", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название услуги/снаряжения"
    t.boolean "active", default: true, comment: "актуальность"
    t.boolean "service", default: true, comment: "отметка услуги"
    t.decimal "price", default: "0.0", comment: "цена"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", comment: "Справочник адресов", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "полное название (необязательное поле)"
    t.boolean "active", default: true, comment: "актуальность"
    t.boolean "verified", default: false, comment: "прошел ли проверку"
    t.boolean "public", default: false, comment: "является ли адрес публичным (для точек выдачи/возврата и т.д.)"
    t.bigint "country_id", comment: "страна регистрации"
    t.bigint "region_id", comment: "регион регистрации (необязательное поле)"
    t.bigint "district_id", comment: "район регистрации (необязательное поле)"
    t.bigint "settlement_id", comment: "нас.пункт регистрации"
    t.string "postcode", comment: "почтовый инедекс (нужен, не?:))"
    t.string "street", comment: "улица"
    t.string "house", comment: "дом"
    t.string "flat", comment: "квартира"
    t.string "address1", comment: "международного формат (необязательное поле)"
    t.string "address2", comment: "международного формат (необязательное поле)"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_addresses_on_country_id"
    t.index ["district_id"], name: "index_addresses_on_district_id"
    t.index ["region_id"], name: "index_addresses_on_region_id"
    t.index ["settlement_id"], name: "index_addresses_on_settlement_id"
  end

  create_table "authentication_tokens", comment: "Справочник временных токенов", force: :cascade do |t|
    t.bigint "user_id"
    t.string "body"
    t.datetime "last_used_at"
    t.integer "expires_in"
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body"], name: "index_authentication_tokens_on_body", unique: true
    t.index ["user_id"], name: "index_authentication_tokens_on_user_id"
  end

  create_table "body_types", comment: "Справочник типов кузовов автомобилей", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название типа кузова/автомобиля"
    t.boolean "active", default: true, comment: "актуальность"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", comment: "Справочник марок автомобилей", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название марки"
    t.boolean "active", default: true, comment: "актуальность"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", comment: "Справочник клиентов", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "полное имя (необязательно)"
    t.boolean "active", default: true, comment: "актуальность"
    t.boolean "verified", default: false, comment: "прошел ли проверку"
    t.string "first_name", comment: "имя"
    t.string "middle_name", comment: "отчество"
    t.string "last_name", comment: "фамилия"
    t.string "gender", comment: "пол"
    t.date "birthday", comment: "дата рождения"
    t.string "phone", comment: "телефонный номер"
    t.bigint "address_id", comment: "адрес проживания (небязательно регистрации)"
    t.bigint "passport_id", comment: "паспорт"
    t.bigint "driver_license_id", comment: "вод.удостоверение"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_clients_on_address_id"
    t.index ["driver_license_id"], name: "index_clients_on_driver_license_id"
    t.index ["passport_id"], name: "index_clients_on_passport_id"
  end

  create_table "countries", comment: "Справочник стран", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово/код"
    t.string "name", comment: "название страны"
    t.boolean "active", default: true, comment: "актуальность"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days_ranges", comment: "Справочник диапазонов дней аренды", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название диапазона дней"
    t.boolean "active", default: true, comment: "актуальность"
    t.integer "days_from", comment: "начало диапазона дней"
    t.integer "days_to", comment: "конец диапазона дней"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days_slices", comment: "Справочник срезов дней (выходные, будние, праздники)", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название среза дней"
    t.boolean "active", default: true, comment: "актуальность"
    t.boolean "week", comment: "дни недели если true, иначе дни месяца"
    t.integer "mon_from", comment: "начальный месяц (nil для дней недели)"
    t.integer "day_from", comment: "начальный день недели/месяца"
    t.time "time_from", comment: "начальное время"
    t.integer "mon_to", comment: "начальный месяц (nil для дней недели)"
    t.integer "day_to", comment: "конечный день недели/месяца"
    t.time "time_to", comment: "конечное время"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", comment: "Справочник административных районов", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название района"
    t.boolean "active", default: true, comment: "актуальность"
    t.bigint "region_id", comment: "регион (необязательное поле)"
    t.bigint "country_id", comment: "страна"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_districts_on_country_id"
    t.index ["region_id"], name: "index_districts_on_region_id"
  end

  create_table "driver_licenses", comment: "Справчник водительских удостоверений", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "полное название (необязательное поле)"
    t.boolean "active", default: true, comment: "актуальность"
    t.boolean "verified", default: false, comment: "прошло ли проверку"
    t.bigint "country_id", comment: "страна выдачи"
    t.string "series_number", comment: "серия и номер удостоверения"
    t.string "category", comment: "категория удостоверения"
    t.string "issued_by", comment: "кем выдано"
    t.string "issued_code", comment: "код подразделения (есть такое?)"
    t.date "issued_date", comment: "дата выдачи"
    t.date "valid_to", comment: "дата окончания действия"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_driver_licenses_on_country_id"
  end

  create_table "formats", comment: "Справочник шаблонов вывода", force: :cascade do |t|
    t.string "formatable_type"
    t.bigint "formatable_id", comment: "связанная таблица"
    t.string "key", comment: "ключ шаблона (поле)"
    t.string "format", comment: "строка шаблона"
    t.string "args", comment: "аругменты для шаблона"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["formatable_type", "formatable_id"], name: "index_formats_on_formatable_type_and_formatable_id"
  end

  create_table "manufactures", comment: "Справочник производителей автомобилей", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название производителя"
    t.boolean "active", default: true, comment: "актуальность"
    t.bigint "brand_id", comment: "марка"
    t.bigint "country_id", comment: "страна производителя"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_manufactures_on_brand_id"
    t.index ["country_id"], name: "index_manufactures_on_country_id"
  end

  create_table "model_classes", comment: "Справочник классов моделей автомобилей", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название класса модели"
    t.boolean "active", default: true, comment: "актуальность"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", comment: "Справочник моделей автомобилей", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название модели"
    t.boolean "active", default: true, comment: "актуальность"
    t.bigint "brand_id", comment: "марка модели"
    t.bigint "manufacture_id", comment: "производитель модели"
    t.bigint "model_class_id", comment: "класс модели"
    t.bigint "body_type_id", comment: "тип кузова"
    t.integer "door_count", comment: "кол-во дверей"
    t.integer "seat_count", comment: "кол-во посадочных мест"
    t.string "style", comment: "стиль модели"
    t.string "transmission", comment: "тип привода"
    t.string "drive_type", comment: "коробка передач"
    t.string "fuel_type", comment: "тип топлива"
    t.string "engine", comment: "двигатель"
    t.float "engine_volume", comment: "объем двигателя"
    t.string "specs", comment: "стандартные характеристики (массив строк)", array: true
    t.string "options", comment: "прочее оснащение (массив строк)", array: true
    t.text "note", comment: "заметки"
    t.string "link", comment: "ссылка на модель"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body_type_id"], name: "index_models_on_body_type_id"
    t.index ["brand_id"], name: "index_models_on_brand_id"
    t.index ["manufacture_id"], name: "index_models_on_manufacture_id"
    t.index ["model_class_id"], name: "index_models_on_model_class_id"
  end

  create_table "order_addons", comment: "Справочник дополнений для каждого заказа", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название услуги/снаряжения (необязательное поле)"
    t.boolean "active", default: true, comment: "актуальность"
    t.bigint "order_id", comment: "связанный заказ"
    t.bigint "addition_id", comment: "услуга/снаряжения"
    t.decimal "price", comment: "цена (если nil, то берется из additions)"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addition_id"], name: "index_order_addons_on_addition_id"
    t.index ["order_id"], name: "index_order_addons_on_order_id"
  end

  create_table "orders", comment: "Справочник заказов", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "можно использовать для пометок (необязательное поле)"
    t.boolean "active", default: true, comment: "актуальность"
    t.string "status", default: "created", comment: "состояние заказа"
    t.bigint "vehicle_id", comment: "прикрепленный автомобиль (может не быть)"
    t.bigint "model_id", comment: "модель (если есть конкретный автомобиль то модель берем оттуда)"
    t.bigint "client_id", comment: "клиент"
    t.bigint "issue_spot_id", comment: "точка выдачи"
    t.bigint "return_spot_id", comment: "точка возврата"
    t.date "date_from", comment: "дата выдачи"
    t.time "time_from", comment: "время выдачи"
    t.date "date_to", comment: "дата возврата"
    t.time "time_to", comment: "время возврата"
    t.integer "days_count", comment: "кол-во дней аренды (которые не попали в другие тарифы?)"
    t.integer "days_over", comment: "кол-во просроченных дней"
    t.bigint "pay_type_id", comment: "форма оплаты"
    t.bigint "rental_type_id", comment: "тарифный план"
    t.bigint "days_range_id", comment: "тариф диапазона дней (nil если не используется)"
    t.bigint "days_slice_id", comment: "тариф среза дней (nil если не используется)"
    t.decimal "days_range_fee", comment: "плата по тарифу диапазона дней"
    t.decimal "days_slice_fee", comment: "плата по тарифу среза дней"
    t.decimal "days_fee", comment: "плата по тарифу по дням"
    t.decimal "addons_fee", comment: "плата за дополнительные услуги/снаряжение"
    t.decimal "forfeit_fee", comment: "штрафы"
    t.decimal "discouts", comment: "скидки"
    t.decimal "total_fee", comment: "общая сумма к оплате"
    t.decimal "total_paid", comment: "сколько уже оплачено от общей суммы (может быть частично/залог)"
    t.boolean "paid_full", default: false, comment: "отметка о полной оплате"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["days_range_id"], name: "index_orders_on_days_range_id"
    t.index ["days_slice_id"], name: "index_orders_on_days_slice_id"
    t.index ["issue_spot_id"], name: "index_orders_on_issue_spot_id"
    t.index ["model_id"], name: "index_orders_on_model_id"
    t.index ["pay_type_id"], name: "index_orders_on_pay_type_id"
    t.index ["rental_type_id"], name: "index_orders_on_rental_type_id"
    t.index ["return_spot_id"], name: "index_orders_on_return_spot_id"
    t.index ["vehicle_id"], name: "index_orders_on_vehicle_id"
  end

  create_table "passports", comment: "Справочник паспортов", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "полное название (необязательное поле)"
    t.boolean "active", default: true, comment: "актуальность"
    t.boolean "verified", default: false, comment: "прошел ли проверку"
    t.bigint "country_id", comment: "страна выдачи"
    t.string "series_number", comment: "серия и номер паспорта"
    t.string "issued_by", comment: "кем выдан"
    t.string "issued_code", comment: "код подразделения"
    t.date "issued_date", comment: "дата выдачи"
    t.date "valid_to", comment: "дата окончания действия"
    t.bigint "address_id", comment: "адрес регистрации"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_passports_on_address_id"
    t.index ["country_id"], name: "index_passports_on_country_id"
  end

  create_table "pay_types", comment: "Справочник форм оплаты", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название формы оплаты"
    t.boolean "active", default: true, comment: "актуальность"
    t.float "tax", default: 0.0, comment: "коэффициент налога (необязательно)"
    t.float "rebate", default: 0.0, comment: "коэффициент льготы (необязательно)"
    t.float "discount", default: 0.0, comment: "коэффициент скидки (необязательно)"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "range_rates", comment: "Справочник коэффициентов по диапазонам дней", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название диапазона дней"
    t.boolean "active", default: true, comment: "актуальность"
    t.bigint "model_class_id", comment: "класс модели автомобиля"
    t.bigint "rental_type_id", comment: "тарифный план"
    t.bigint "days_range_id", comment: "диапазон дней"
    t.float "rate", comment: "коэффициент"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["days_range_id"], name: "index_range_rates_on_days_range_id"
    t.index ["model_class_id"], name: "index_range_rates_on_model_class_id"
    t.index ["rental_type_id"], name: "index_range_rates_on_rental_type_id"
  end

  create_table "regions", comment: "Справочник регионов (республика/край/область/округ)", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название региона"
    t.boolean "active", default: true, comment: "актуальность"
    t.bigint "country_id", comment: "страна"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "rental_types", comment: "Справочник тарифных планов", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название тарифного плана (зима, лето, ...)"
    t.boolean "active", default: true, comment: "актуальность"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", comment: "Справчник тарифов для моделей автомобилей", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название тарифа"
    t.boolean "active", default: true, comment: "актуальность"
    t.bigint "model_id", comment: "модель"
    t.bigint "rental_type_id", comment: "тарифный план"
    t.integer "km_limit", comment: "лимит пробега"
    t.decimal "km_cost", comment: "стоимость километра (сверх лимита?)"
    t.decimal "hour_cost", comment: "стоимость часа"
    t.decimal "day_cost", comment: "стоимость суток"
    t.decimal "forfeit", comment: "штраф за просроченный день"
    t.decimal "earnest", comment: "залог"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_rentals_on_model_id"
    t.index ["rental_type_id"], name: "index_rentals_on_rental_type_id"
  end

  create_table "settlements", comment: "Справочник населенных пунктов (город/деревня/село)", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название нас.пункта"
    t.boolean "active", default: true, comment: "актуальность"
    t.bigint "status_id", comment: "статус нас.пункта"
    t.bigint "district_id", comment: "административный район (необязательное поле)"
    t.bigint "region_id", comment: "регион (необязательное поле)"
    t.bigint "country_id", comment: "страна"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_settlements_on_country_id"
    t.index ["district_id"], name: "index_settlements_on_district_id"
    t.index ["region_id"], name: "index_settlements_on_region_id"
    t.index ["status_id"], name: "index_settlements_on_status_id"
  end

  create_table "slice_rates", comment: "Справочник коэффициентов по срезам дней", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название среза дней"
    t.boolean "active", default: true, comment: "актуальность"
    t.bigint "model_class_id", comment: "класс модели автомобиля"
    t.bigint "rental_type_id", comment: "тарифный план"
    t.bigint "days_slice_id", comment: "срез дней"
    t.float "rate", comment: "коэффициент"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["days_slice_id"], name: "index_slice_rates_on_days_slice_id"
    t.index ["model_class_id"], name: "index_slice_rates_on_model_class_id"
    t.index ["rental_type_id"], name: "index_slice_rates_on_rental_type_id"
  end

  create_table "spots", comment: "Справочник точек выдачи/возврата", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название точки"
    t.boolean "active", default: true, comment: "актуальность"
    t.bigint "address_id", comment: "адрес точки"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_spots_on_address_id"
  end

  create_table "statuses", comment: "Справочник статусов нас.пунктов (город, село, деревня...)", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название статуса населенного пункта: город, село, деревня..."
    t.boolean "active", default: true, comment: "актуальность"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trunk_types", comment: "Справочник типов багажников автомобилей", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название типа багажника"
    t.boolean "active", default: true, comment: "актуальность"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trunks", comment: "Справочник багажников автомобилей", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название багажника"
    t.boolean "active", default: true, comment: "актуальность"
    t.bigint "model_id", comment: "модель автомобиля"
    t.bigint "trunk_type_id", comment: "тип банажника"
    t.decimal "price", comment: "цена (необязательна)"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_trunks_on_model_id"
    t.index ["trunk_type_id"], name: "index_trunks_on_trunk_type_id"
  end

  create_table "users", comment: "Справочник пользователей", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", default: "", null: false, comment: "имя пользователя (nickname)"
    t.boolean "active", default: true, comment: "актуальность"
    t.boolean "verified", default: false, comment: "прошел ли проверку"
    t.string "role", default: "user", null: false, comment: "роль пользователя в системе (admin, user и прочие)"
    t.string "email", default: "", null: false, comment: "электронная почта"
    t.string "encrypted_password", default: "", null: false, comment: "зашифрованнный пароль"
    t.string "image", comment: "фотка/аватар/картинка профиля"
    t.bigint "client_id", comment: "клиент (необязательно)"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["client_id"], name: "index_users_on_client_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", comment: "Справочник автомобилей", force: :cascade do |t|
    t.string "code", comment: "короткое название/аббревиатура/ключевое слово"
    t.string "name", comment: "название машины, примерно: <марка> <модель> <гос.номер>"
    t.boolean "active", default: true, comment: "актуальность"
    t.bigint "model_id", comment: "модель"
    t.string "garage_no", comment: "гаражный номер"
    t.string "state_no", comment: "гос. номер"
    t.string "vin", comment: "идентификационный номер автомобиля"
    t.date "release", comment: "дата выпуска"
    t.integer "mileage", comment: "пробег"
    t.string "color", comment: "цвет"
    t.string "specs", comment: "стандартные характеристики (массив строк)", array: true
    t.string "options", comment: "прочее оснащение (массив строк)", array: true
    t.bigint "trunk_id", comment: "багажник"
    t.text "note", comment: "заметки"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id"], name: "index_vehicles_on_model_id"
    t.index ["trunk_id"], name: "index_vehicles_on_trunk_id"
  end

  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "districts"
  add_foreign_key "addresses", "regions"
  add_foreign_key "addresses", "settlements"
  add_foreign_key "authentication_tokens", "users"
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
  add_foreign_key "orders", "days_ranges"
  add_foreign_key "orders", "days_slices"
  add_foreign_key "orders", "models"
  add_foreign_key "orders", "pay_types"
  add_foreign_key "orders", "rental_types"
  add_foreign_key "orders", "spots", column: "issue_spot_id"
  add_foreign_key "orders", "spots", column: "return_spot_id"
  add_foreign_key "orders", "vehicles"
  add_foreign_key "passports", "addresses"
  add_foreign_key "passports", "countries"
  add_foreign_key "range_rates", "days_ranges"
  add_foreign_key "range_rates", "model_classes"
  add_foreign_key "range_rates", "rental_types"
  add_foreign_key "regions", "countries"
  add_foreign_key "rentals", "models"
  add_foreign_key "rentals", "rental_types"
  add_foreign_key "settlements", "countries"
  add_foreign_key "settlements", "districts"
  add_foreign_key "settlements", "regions"
  add_foreign_key "settlements", "statuses"
  add_foreign_key "slice_rates", "days_slices"
  add_foreign_key "slice_rates", "model_classes"
  add_foreign_key "slice_rates", "rental_types"
  add_foreign_key "spots", "addresses"
  add_foreign_key "trunks", "models"
  add_foreign_key "trunks", "trunk_types"
  add_foreign_key "users", "clients"
  add_foreign_key "vehicles", "models"
  add_foreign_key "vehicles", "trunks"
end
