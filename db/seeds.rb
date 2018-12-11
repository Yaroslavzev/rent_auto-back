# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require_relative 'additions_seeds.rb'
Faker::Config.locale = 'ru'
Money.locale_backend = :i18n



BODY_TYPES = %w[автобус внедорожник кабриолет кроссовер купе лимузин лифтбэк микроавтобус минивэн пикап
                родстер седан стретч тарга универсал фургон хэтчбек].freeze

FULL_NAME_MODELS = ["LADA Granta седан акпп",
"LADA Granta седан мкпп",
"LADA Granta лифтбек мкпп",
"LADA Vesta седан мкпп",
"LADA XRAY хэтчбэк мкпп",
"Volkswagen Multivan минивэн акпп",
"Volkswagen Polo седан мкпп",
"Peugeot 301 седан мкпп",
"KIA Rio седан акпп",
"Nissan Almera седан акпп",
"Škoda Fabia хэтчбэк мкпп",
"Škoda Rapid хэтчбэк акпп"]

MAX_SEEDS = FULL_NAME_MODELS.size


LOCALITY_STATUSES = %w[аул город деревня железно-дорожная\ станция населенный\ пункт поселок
                       поселок\ городского\ типа село слобода станица].freeze

MODEL_CLASSES = %w[стандарт бизнес премиум эконом].freeze

BODY_TYPES = %w[автобус внедорожник кабриолет кроссовер купе лимузин лифтбэк микроавтобус минивэн пикап
                родстер седан стретч тарга универсал фургон хэтчбек].freeze

TRUNK_TYPES = %w[бокс\ жесткий бокс\ мягкий велосипед корзина лодка лыжи/сноуборд специальный].freeze

ADDITIONS = %w[автокресло навигатор переходник\ в\ прикуриватель подача\ город возврат\ город
               подача\ аэропорт возврат\ аэропорт услуги\ водителя].freeze

RENTAL_TYPES = %w[основной].freeze

PAY_TYPES = %w[наличный безналичный банковская\ карта натурой].freeze

DAYS_RANGES = [[1, 6], [7, 20], [21, nil]].freeze

DAYS_SLICE_KEYS = %i[name week mon_from day_from time_from mon_to day_to time_to].freeze
DAYS_SLICES = [['выходные дни', true, nil, 5, '17:00', nil, 1, '10:00'],
               ['рабочие дни', true, nil, 1, '10:00', nil, 5, '17:00'],
               ['новый год', false, 12, 31, '17:00', 1, 10, '10:00'],
               ['майские праздники', false, 4, 30, '17:00', 5, 10, '10:10']].freeze

FORMATS_KEYS = %i[formatable_type formatable_id key format args].freeze
# rubocop:disable LineLength
FORMATS = [['Model', nil, 'full_name', '%<brand>s %<model>s %<class>s %<volume>.1f %<style>s ',
            '{ brand: $.brand.name, model: $.name, volume: $.engine_volume, style: $.style, class: $.model_class.name }'],
           ['Client', nil, 'full_name', '%<last>s %<first>s %<middle>s',
            '{ first: $.first_name, middle: $.middle_name, last: $.last_name }']].freeze
# rubocop:enable LineLength

# Генерация поля code по правилам зависимым от параметров:
#   - если в 1м параметре 1 слово, то берем 3 первых буквы, исключая гласные, кроме первой,
#     vowel = true и если согласных больше 2х (не считая 1й буквы),
#     иначе исключает выбирает первые 3 буквы исключая гласные на конце
#   - если слов больше 2х - берем первую букву от каждого слова и склеиваем
#   - остальные параметры добавляются как есть через '-'
# rubocop:disable CyclomaticComplexity, PerceivedComplexity
def gen_code(name, vowel = false, *others)
  code_size = 3 # 3х букв для кода достаточно(?)
  code = ''
  words = name.downcase.split(%r{[\s/-]+})
  if words.size > 1
    code = words.inject('') { |s, w| s += w[0] }
    code = code.insert(code_size / 2, '/') if code.size < code_size
  else
    word = words[0]
    if vowel || (word.scan(/[^аеёийоуъыьэюя]/).size < code_size)
      i = code_size - 1
      i += 1 while (i < word.size) && 'аеёийоуъыьэюя'.include?(word[i])
      code = word[0..i]
      code = code.gsub(/(\W)[аеёийоуъыьэюя]/, '\1') if code.size > code_size
    else
      code = word.gsub(/(\W)[аеёийоуъыьэюя]/, '\1')[0..code_size - 1]
      # word.split('').each do |l|
      #   code += l if code.blank? or not 'аеёийоуъыьэюя'.include? l
      #   break if code.size >= CODE_SIZE
      # end
    end
  end
  code += others.inject('') { |s, c| s += "-#{c}" } unless others.size.zero?
  code
end
# rubocop:enable CyclomaticComplexity, PerceivedComplexity

# Генерация числа заданной разрядности ввиде строки
def gen_num_str(num)
  num.times.inject('') { |s| s += rand(0..9).to_s }
end

# Понеслась...
puts 'Генерируется база:'

# Заполнить справочник форматов
print ' • справочник форматов'
seeds = FORMATS.inject([]) do |arr, fmt|
  print '.'
  next if Format.find_by(formatable_type: fmt[0], key: fmt[2]).present?

  arr << FORMATS_KEYS.zip(fmt).to_h
end
formats = seeds.blank? ? Format.all : Format.create!(seeds)

puts

# Заполнить справочник статусов населенных пунктов
print ' • справочник статусов населенных пунктов'
seeds = LOCALITY_STATUSES.inject([]) do |arr, stat|
  print '.'
  code = gen_code(stat, true)
  next if Status.find_by(code: code).present?

  arr << {
    # code: stat[0],
    code: code,
    name: stat,
    note: stat.capitalize
  }
end
statuses = seeds.blank? ? Status.all : Status.create!(seeds)
puts


print ' • справочник классов моделей автомобилей'
seeds = FULL_NAME_MODELS.inject([]) do |arr, trans|
  print '.'
  const = gen_code(trans)

  arr << {
    code: const,
    name: trans.split(/\s+/)[2],
    note: const
  }
end
model_classes = seeds.blank? ? ModelClass.all : ModelClass.create!(seeds)
puts


# Заполнить справочник дополнительных услуг и снаряжения
print ' • справочник дополнительных услуг/снаряжения'
seeds = ADDITIONS.inject([]) do |arr, addon|
  print '.'
  code = gen_code(addon)
  next if Addition.find_by(code: code).present?

  arr << {
    code: code,
    name: addon,
    active: true,
    service: rand(2).zero?,
    price: rand(2).zero? ? 0 : rand(10..20) * 100,
    note: addon.capitalize
  }
end
additions = seeds.blank? ? Addition.all : Addition.create!(seeds)
puts

# Заполнить справочник типов кузовов автомобилей
print ' • справочник типов кузовов автомобилей'
seeds = BODY_TYPES.inject([]) do |arr, type|
  print '.'
  code = gen_code(type)
  next if BodyType.find_by(code: code).present?

  arr << {
    code: code,
    name: type,
    note: type.capitalize
  }
end
body_types = seeds.blank? ? BodyType.all : BodyType.create!(seeds)
puts

# Заполнить справочник типов багажников автомобилей
print ' • справочник типов багажников автомобилей'
seeds = TRUNK_TYPES.inject([]) do |arr, type|
  print '.'
  # объединить в один gsub не вышло, как экранировать '/' есть идеи?
  code = gen_code(type)
  next if TrunkType.find_by(code: code).present?

  arr << {
    code: code,
    name: type,
    note: type.capitalize
  }
end
trunk_types = seeds.blank? ? TrunkType.all : TrunkType.create!(seeds)
puts

# Заполнить справочник типов тарифных планов
print ' • справочник типов тарифных планов'
seeds = RENTAL_TYPES.inject([]) do |arr, type|
  print '.'
  code = gen_code(type)
  next if RentalType.find_by(code: code).present?

  arr << {
    code: code,
    name: type,
    note: type.capitalize
  }
end
rental_types = seeds.blank? ? RentalType.all : RentalType.create!(seeds)
puts

# Заполнить справочник диапазонов дней аренды
print ' • справочник диапазонов дней аренды'
seeds = DAYS_RANGES.inject([]) do |arr, range|
  print '.'
  code = "д#{range[0]}" + (range[1].nil? ? '+' : "-#{range[1]}")
  range_name = "от #{range[0]}"
  range_name += " до #{range[1]}" unless range[1].nil?
  range_name += ' дней'
  next if DaysRange.find_by(code: code).present?

  arr << {
    code: code,
    name: range_name,
    days_from: range[0],
    days_to: range[1],
    note: range_name.capitalize
  }
end
days_ranges = seeds.blank? ? DaysRange.all : DaysRange.create!(seeds)
puts

# Заполнить справочник срезов дней аренды
print ' • справочник срезов дней аренды'
seeds = DAYS_SLICES.inject([]) do |arr, slice|
  print '.'
  code = gen_code(slice[0])
  next if DaysSlice.find_by(code: code).present?

  arr << { code: code }
         .merge(DAYS_SLICE_KEYS.zip(slice).to_h)
         .merge(note: slice[0].capitalize)
end
days_slices = seeds.blank? ? DaysSlice.all : DaysSlice.create!(seeds)
puts

# Заполнить справочник форм оплаты
print ' • справочник форм оплаты'
seeds = PAY_TYPES.inject([]) do |arr, type|
  print '.'
  code = gen_code(type)
  next if PayType.find_by(code: code).present?

  arr << {
    code: code,
    name: type,
    note: type.capitalize
  }
end
pay_types = seeds.blank? ? PayType.all : PayType.create!(seeds)
puts

# Заполнить данные для окружения разработки
if Rails.env.development?
  # Удалить сгенерированные записи
  OrderAddon.destroy_all
  Order.destroy_all
  Rental.destroy_all
  RangeRate.destroy_all
  SliceRate.destroy_all

  Vehicle.destroy_all
  Trunk.destroy_all
  Model.destroy_all
  Manufacture.destroy_all
  Brand.destroy_all

  User.destroy_all
  Client.destroy_all
  DriverLicense.destroy_all
  Passport.destroy_all

  Spot.destroy_all
  Address.destroy_all
  Settlement.destroy_all
  District.destroy_all
  Region.destroy_all
  Country.destroy_all

  # Заполнить справочник стран
  print ' • справочник стран'
  seeds = MAX_SEEDS.times.map do
    print '.'
    address = Faker::Address
    {
      code: address.country_code,
      name: address.country,
      note: address.community
    }
  end
  countries = Country.create! seeds
  puts

  # Заполнить справочник регионов (республика/край/область/округ)
  print ' • справочник регионов (республика/край/область/округ)'
  seeds = (2 * MAX_SEEDS).times.map do
    print '.'
    address = Faker::Address
    {
      code: address.state_abbr,
      name: address.state,
      country: countries.sample,
      note: address.community
    }
  end
  regions = Region.create! seeds
  puts

  # Заполнить справочник административных районов
  print ' • справочник административных районов'
  seeds = (4 * MAX_SEEDS).times.map do
    print '.'
    region = regions.sample
    address = Faker::Address
    {
      code: address.state_abbr,
      name: address.state,
      region: region,
      country: region.country,
      note: address.community
    }
  end
  districts = District.create! seeds
  puts

  # Заполнить справочник населенных пунктов (город/деревня/село)
  print ' • справочник населенных пунктов (город/деревня/село)'
  seeds = (8 * MAX_SEEDS).times.map do
    print '.'
    district = districts.sample
    region = district.region
    country = region.country
    address = Faker::Address
    {
      code: address.state_abbr,
      name: address.city,
      status: statuses.sample,
      district: district,
      region: region,
      country: country,
      note: address.community
    }
  end
  settlements = Settlement.create! seeds
  puts

  # Заполнить справочник адресов
  print ' • справочник адресов'
  seeds = (16 * MAX_SEEDS).times.map do
    print '.'
    address = Faker::Address
    settlement = settlements.sample
    district = settlement.district
    region = district.region
    country = region.country
    street = address.street_name
    house = address.building_number
    flat = address.secondary_address
    {
      # code: address.state_abbr,
      name: "#{country.name}, #{region.name}, #{district.name}, #{settlement.name}, #{street}, #{house}, #{flat}",
      country: country,
      region: region,
      district: district,
      settlement: settlement,
      postcode: address.postcode,
      street: street,
      house: house,
      flat: flat,
      note: address.community
    }
  end
  addresses = Address.create! seeds
  puts

  # Заполнить справочник точек выдачи/возврата
  print ' • справочник точек выдачи/возврата'
  seeds = MAX_SEEDS.times.map do |no|
    print '.'
    spot = 'гараж'
    # no = rand(10).to_s
    spot_name = "#{spot} ##{no}"
    {
      code: gen_code(spot) + no.to_s,
      name: spot_name,
      address: addresses.sample,
      note: spot_name.capitalize
    }
  end
  spots = Spot.create! seeds
  puts

  # Заполнить справочник паспортов
  print ' • справочник паспортов'
  seeds = (2 * MAX_SEEDS).times.map do
    print '.'
    address = addresses.sample
    {
      # code:
      # name:
      country: address.country,
      series_number: "#{gen_num_str(2)} #{gen_num_str(2)} #{gen_num_str(6)}",
      issued_by: "ПВО ОВД, #{address.region.name}, #{address.settlement.name}",
      issued_code: "#{gen_num_str(3)}-#{gen_num_str(3)}",
      issued_date: Faker::Date.between(20.years.ago, Date.today),
      valid_to: Faker::Date.between(5.years.ago, 15.years.from_now),
      address: address
      # note:
    }
  end
  passports = Passport.create! seeds
  puts

  # Заполнить справочник водительских прав
  print ' • справочник водительских прав'
  seeds = (2 * MAX_SEEDS).times.map do
    print '.'
    address = addresses.sample
    {
      # code:
      # name:
      country: address.country,
      series_number: "#{gen_num_str(4)} #{gen_num_str(6)}",
      issued_by: "ГИБДД, #{address.region.name}, #{address.settlement.name}",
      issued_code: "#{gen_num_str(3)}-#{gen_num_str(3)}",
      issued_date: Faker::Date.between(20.years.ago, Date.today),
      valid_to: Faker::Date.between(5.years.ago, 15.years.from_now)
      # note:
    }
  end
  driver_licenses = DriverLicense.create! seeds
  puts

  # Заполнить справочник клиентов
  print ' • справочник клиентов'
  seeds = MAX_SEEDS.times.map do
    print '.'
    gender = Faker::Gender.binary_type
    first_name = gender == 'Male' ? Faker::Name.male_first_name : Faker::Name.female_first_name
    middle_name = Faker::Name.middle_name
    last_name = Faker::Name.last_name
    full_name = "#{last_name} #{first_name} #{middle_name}"
    {
      # code:
      name: full_name,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      gender: gender,
      birthday: Faker::Date.birthday(18, 65),
      phone: Faker::PhoneNumber.cell_phone,
      address: addresses.sample,
      passport: passports.sample,
      driver_license: driver_licenses.sample,
      note: Faker::Lorem.sentence
    }
  end
  clients = Client.create! seeds
  puts

  # Заполнить справочник пользователей
  print ' • справочник пользователей'
  # пустышка
  print '.'
  seeds = []
  code = 'unknown'
  if User.find_by(code: code).blank?
    seeds << {
      code: code,
      name: code,
      active: false,
      role: code,
      email: "#{code}@#{code}",
      password: "#{code}123",
      image: nil,
      client: nil,
      note: 'Unknown user with fake email and password'
    }
  end
  # пароль = имейл
  seeds += clients.map do |client|
    print '.'
    username = Faker::Internet.username
    email = Faker::Internet.safe_email(username)
    {
      code: username,
      name: username,
      email: email,
      password: email,
      image: Faker::Avatar.image,
      client: client,
      note: Faker::Lorem.sentence
    }
  end
  users = User.create! seeds
  puts

  # Заполнить справочник брендов
  print ' • справочник брендов'
  seeds = FULL_NAME_MODELS.inject([]) do |arr, brand|
    print '.'
    make, code = nil
    arr << {
      code: code,
      name: brand.split(/\s+/)[0],
      note: code
    }
  end
  brands = Brand.create! seeds
  puts

  # Заполнить справочник производителей
  print ' • справочник производителей'
  seeds = FULL_NAME_MODELS.size.times.map do
    print '.'
    manufacture = Faker::Vehicle.manufacture
    const = nil
    {
      code: manufacture[0..2].downcase + rand(0..9).to_s,
      name: manufacture,
      brand: brands.sample,
      country: countries.sample,
      note: Faker::Company.catch_phrase
    }
  end
  manufactures = Manufacture.create! seeds
  puts

  # Заполнить справочник моделей автомобилей
  print ' • справочник моделей автомобилей'
  seeds = MAX_SEEDS.times.map do |id|
    print '.'
    model = Faker::Vehicle.model
    brand = brands.sample

    {
      code: "#{brand.code}-#{model[0..2].downcase}",
      name: FULL_NAME_MODELS[id].split(/\s+/)[1],
      brand: brands[id],
      model_class: model_classes[id],
      manufacture: manufactures.sample,
      body_type: body_types.sample,
      door_count: rand(2..7),
      seat_count: rand(2..7),
      style: FULL_NAME_MODELS[id].split(/\s+/)[3],
      transmission: Faker::Vehicle.transmission,
      drive_type: Faker::Vehicle.drive_type,
      fuel_type: Faker::Vehicle.fuel_type,
      engine: Faker::Vehicle.engine,
      engine_volume: rand(10..50).to_f / 10,
      specs: Faker::Vehicle.standard_specs,
      options: Faker::Vehicle.car_options,
      note: DESCR_OF_MODELS[id],
      link: "https://api.rent-auto.biz.tm/images/model_#{id+1}.jpg"
    }
  end
  models = Model.create! seeds
  puts

  # Заполнить справочник багажников автомобилей
  print ' • справочник багажников автомобилей'
  seeds = models.map do |model|
    rand(1..(trunk_types.size / 2)).times.inject([]) do |arr|
      print '.'
      # выбираем еще неиспользованный тип
      type = nil
      loop do
        type = trunk_types.sample
        break unless arr.any? { |h| h[:trunk_type] == type }
      end
      trunk = "#{model.name}(#{type.name})"
      arr << {
        code: "#{model.code}-#{type.code}",
        name: trunk,
        model: model,
        trunk_type: type,
        price: nil,
        note: trunk
      }
    end
  end
  trunks = Trunk.create! seeds.flatten
  puts

  # Заполнить справочник коэффициентов по диапазонам дней
  print ' • справочник коэффициентов по диапазонам дней'
  seeds = model_classes.map do |klass|
    rental_types.map do |type|
      days_ranges.map do |range|
        print '.'
        rate_name = "#{range.name} (#{klass.name}-#{type.name})"
        {
          code: "#{range.code}-#{klass.code}-#{type.code}",
          name: rate_name,
          model_class: klass,
          rental_type: type,
          days_range: range,
          rate: rand(80..100).to_f / 100,
          note: rate_name
        }
      end
    end
  end
  range_rates = RangeRate.create! seeds.flatten
  puts

  # Заполнить справочник коэффициентов по срезам дней
  print ' • справочник коэффициентов по срезам дней'
  seeds = model_classes.map do |klass|
    rental_types.map do |type|
      days_slices.map do |slice|
        print '.'
        rate_name = "#{slice.name} (#{klass.name}-#{type.name})"
        {
          code: "#{slice.code}-#{klass.code}-#{type.code}",
          name: rate_name,
          model_class: klass,
          rental_type: type,
          days_slice: slice,
          rate: rand(80..100).to_f / 100,
          note: rate_name.capitalize
        }
      end
    end
  end
  slice_rates = SliceRate.create! seeds.flatten
  puts

  # Заполнить справочник тарифов для моделей
  print ' • справочник тарифов для моделей'
  seeds = models.map do |model|
    rental_types.map do |type|
      price_name = "#{model.name} (#{model.model_class.name}-#{type.name})"
      km = rand(50..100) / 10
      day = rand(10..20) * 100
      print '.'
      {
        code: "#{model.code}-#{model.model_class.code}-#{type.code}",
        name: price_name,
        model: model,
        rental_type: type,
        km_limit: rand(10..30) * 10,
        km_cost: km,
        hour_cost: day / 20,
        day_cost: day,
        forfeit: day * 1.5,
        earnest: day * 3,
        note: price_name
      }
    end
  end
  rentals = Rental.create! seeds.flatten
  puts

  # Заполнить справочник автомобилей
  print ' • справочник автомобилей'
  seeds = MAX_SEEDS.times.map do
    print '.'
    model = models.sample
    vin = Faker::Vehicle.vin
    {
      code: "#{model.code}-#{vin}",
      name: "#{model.name}(#{vin})",
      model: model,
      garage_no: vin,
      state_no: vin,
      vin: vin,
      release: Date.new(Faker::Vehicle.year.to_i),
      mileage: Faker::Vehicle.mileage,
      color: Faker::Vehicle.color,
      specs: Faker::Vehicle.standard_specs,
      options: Faker::Vehicle.car_options,
      trunk: trunks.select { |t| t.model == model }.sample,
      note: Faker::Company.catch_phrase
    }
  end
  vehicles = Vehicle.create! seeds
  puts

  # Заполнить справочник заказов
  print ' • справочник заказов'
  seeds = MAX_SEEDS.times.map do
    print '.'
    vehicle = vehicles.sample
    model = vehicle.model
    date_from = Faker::Date.forward(10)
    time_from = Faker::Time.between(Time.current, Time.current + 1.day)
    date_to = Faker::Date.between(date_from, date_from + 30.days)
    time_to = Faker::Time.between(Time.current, Time.current + 1.day)
    days_count = (date_to - date_from).to_i
    days_over = rand(0..days_count)
    pay_type = pay_types.sample
    rental_type = rental_types.sample
    days_range = rand(2).zero? ? nil : days_ranges.sample
    days_slice = rand(2).zero? ? nil : days_slices.sample
    days_range_fee = days_range ? 0 : 0 # заглушка
    days_slice_fee = days_slice ? 0 : 0 # заглушка
    days_fee = (date_to - date_from).to_i * model.rentals.select { |r| r.rental_type == rental_type }.first.day_cost
    addons_fee = 0
    forfeit_fee = rand(2).zero? ? 0 : 0 # заглушка
    discouts = rand(2).zero? ? 0 : 0 # заглушка
    total_fee = days_range_fee + days_slice_fee + days_fee + addons_fee + forfeit_fee - discouts
    total_paid = rand(2).zero? ? 0 : 0 # заглушка
    {
      vehicle: vehicle,
      model: vehicle.model,
      client: clients.sample,
      issue_spot: spots.sample,
      return_spot: spots.sample,
      date_from: date_from,
      time_from: time_from,
      date_to: date_to,
      time_to: time_to,
      days_count: days_count,
      days_over: days_over,
      pay_type: pay_type,
      rental_type: rental_type,
      days_range: days_range,
      days_slice: days_slice,
      days_range_fee: days_range_fee,
      days_slice_fee: days_slice_fee,
      days_fee: days_fee,
      addons_fee: addons_fee,
      forfeit_fee: forfeit_fee,
      discouts: discouts,
      total_fee: total_fee,
      total_paid: total_paid
    }
  end
  orders = Order.create! seeds
  puts

  # Заполнить справочник заказов
  print ' • справочник дополнений к заказам'
  seeds = orders.map do |order|
    sum = 0
    arr = []
    arr << rand(0..rand(additions.size / 2)).times.map do
      print '.'
      addon = additions.sample
      price = addon.price
      sum += price
      {
        code: addon.code,
        name: addon.name,
        order: order,
        addition: addon,
        price: addon.price
      }
    end
    # добавить суммарную стоимость в заказы (лучше триггерами/калбэками?)
    order.addons_fee = sum
    order.total_fee += sum
    order.save!
    arr
  end
  order_addons = OrderAddon.create! seeds.flatten
  puts

end
