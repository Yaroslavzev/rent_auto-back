# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::Config.locale = 'ru'
Money.locale_backend = :i18n

MAX_SEEDS = 10

LOCALITY_STATUSES = %w[аул город деревня железно-дорожная\ станция населенный\ пункт поселок
                       поселок\ городского\ типа село слобода станица].freeze

MODEL_CLASSES = %w[бизнес премиум эконом].freeze

BODY_TYPES = %w[автобус внедорожник кабриолет кроссовер купе лимузин лифтбэк микроавтобус минивэн пикап
                родстер седан стретч тарга универсал фургон хэтчбек].freeze

TRUNK_TYPES = %w[бокс\ жесткий бокс\ мягкий велосипед корзина лодка лыжи/сноуборд специальный]

ADDITIONS = %w[автокресло навигатор переходник\ в\ прикуриватель подача\ город возврат\ город
               подача\ аэропорт возврат\ аэропорт услуги\ водителя]

RENTAL_TYPES = %w[основной демисезон зимний летний].freeze

DAY_RANGES = [[1,3],[3,7],[7,15],[15,30],[30,nil]].freeze

# Генерация поля code по правилам зависимым от параметров:
#   - если в 1м параметре 1 слово, то берем 3 первых буквы, исключая гласные, кроме первой,
#     vowel = true и если согласных больше 2х (не считая 1й буквы),
#     иначе исключает выбирает первые 3 буквы исключая гласные на конце
#   - если слов больше 2х - берем первую букву от каждого слова и склеиваем
#   - остальные параметры добавляются как есть через '-'
def gen_code(name, vowel = false, *others)
  code_size = 3 # 3х букв для кода достаточно(?)
  code = ''
  words = name.downcase.split(/[\s\/-]+/)
  if words.size > 1
    code = words.inject('') { |s,w| s += w[0] }
    code = code.insert(code_size / 2, '/') if code.size < code_size
  else
    word = words[0]
    if vowel or word.scan(/[^аеёийоуъыьэюя]/).size < code_size
      i = code_size - 1
      i +=1 while i < word.size and 'аеёийоуъыьэюя'.include? word[i]
      code = word[0..i]
      code = code.gsub(/(\W)[аеёийоуъыьэюя]/, '\1') if code.size > code_size
    else
      code = word.gsub(/(\W)[аеёийоуъыьэюя]/, '\1')[0..code_size-1]
      # word.split('').each do |l|
      #   code += l if code.blank? or not 'аеёийоуъыьэюя'.include? l
      #   break if code.size >= CODE_SIZE
      # end
    end
  end
  if others.size > 0
    code += others.inject('') { |s,c| s += "-#{c}" }
  end
  code
end

# Генерация числа заданной разрядности ввиде строки
def gen_num_str(n)
  n.times.inject('') { |s| s += rand(0..9).to_s }
end

# Понеслась...
puts 'Генерируется база:'

# Заполнить справочник статусов населенных пунктов
print ' • справочник статусов населенных пунктов'
seeds = LOCALITY_STATUSES.inject([]) do |arr,stat|
  print '.'
  code = gen_code(stat, true)
  arr << {
    # code: stat[0],
    code: code,
    name: stat,
    note: stat.capitalize
  } if Status.find_by_code(code).blank?
end
statuses = seeds.blank? ? Status.all : Status.create!(seeds)
puts

# Заполнить справочник классов моделей автомобилей
print ' • справочник классов моделей автомобилей'
seeds = MODEL_CLASSES.inject([]) do |arr,klass|
  print '.'
  code = gen_code(klass)
  arr << {
    code: code,
    name: klass,
    note: klass.capitalize
  } if ModelClass.find_by_code(code).blank?
end
model_classes = seeds.blank? ? ModelClass.all : ModelClass.create!(seeds)
puts

# Заполнить справочник дополнительных услуг и снаряжения
print ' • справочник дополнительных услуг и снаряжения'
seeds = ADDITIONS.inject([]) do |arr,addon|
  print '.'
  code = gen_code(addon)
  arr << {
    code: code,
    name: addon,
    active: true,
    service: rand(1) == 1,
    price: rand(10..20) * 100,
    note: addon.capitalize
  } if Addition.find_by_code(code).blank?
end
additions = seeds.blank? ? Addition.all : Addition.create!(seeds)
puts

# Заполнить справочник типов кузовов автомобилей
print ' • справочник типов кузовов автомобилей'
seeds = BODY_TYPES.inject([]) do |arr,type|
  print '.'
  code = gen_code(type)
  arr << {
    code: code,
    name: type,
    note: type.capitalize
  } if BodyType.find_by_code(code).blank?
end
body_types = seeds.blank? ? BodyType.all : BodyType.create!(seeds)
puts

# Заполнить справочник типов багажников автомобилей
print ' • справочник типов багажников автомобилей'
seeds = TRUNK_TYPES.inject([]) do |arr,type|
  print '.'
  # объединить в один gsub не вышло, как экранировать '/' есть идеи?
  code = gen_code(type)
  arr << {
    code: code,
    name: type,
    note: type.capitalize
  } if TrunkType.find_by_code(code).blank?
end
trunk_types = seeds.blank? ? TrunkType.all : TrunkType.create!(seeds)
puts

# Заполнить справочник типов тарифных планов
print ' • справочник типов тарифных планов'
seeds = RENTAL_TYPES.inject([]) do |arr,type|
  print '.'
  code = gen_code(type)
  arr << {
    code: code,
    name: type,
    note: type.capitalize
  } if RentalType.find_by_code(code).blank?
end
rental_types = seeds.blank? ? RentalType.all : RentalType.create!(seeds)
puts

# Заполнить справочник диапазонов дней аренды
print ' • справочник диапазонов дней аренды'
seeds = DAY_RANGES.inject([]) do |arr,range|
  print '.'
  code = "д#{range[0]}" + (range[1].nil? ? '+' : "-#{range[1]}")
  range_name = "от #{range[0]}" 
  range_name += " до #{range[1]}" unless range[1].nil?
  range_name += ' дней'
  arr << {
    code: code,
    name: range_name,
    day_from: range[0],
    day_to: range[1],
    note: range_name.capitalize
  } if DayRange.find_by_code(code).blank?
end
day_ranges = seeds.blank? ? DayRange.all : DayRange.create!(seeds)
puts

# Заполнить данные для окружения разработки
if Rails.env.development?
  # Удаляем сгенерированные записи
  RentalPrice.destroy_all
  RangeRate.destroy_all
  RentalRate.destroy_all

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
  seeds = (2*MAX_SEEDS).times.map do
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
  seeds = (4*MAX_SEEDS).times.map do
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
  seeds = (8*MAX_SEEDS).times.map do
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
  seeds = (16*MAX_SEEDS).times.map do
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
  seeds = (2*MAX_SEEDS).times.map do
    print '.'
    address = addresses.sample
    {
      # code:
      # name:
      country: address.country,
      serial: gen_num_str(4),
      number: gen_num_str(6),
      issued_by: "ПВО ОВД, #{address.region.name}, #{address.settlement.name}",
      issued_code: "#{gen_num_str(3)}-#{gen_num_str(3)}",
      issued_date: Faker::Date.between(20.year.ago, Date.today),
      valid_to: Faker::Date.between(5.year.ago, 15.year.from_now),
      address: address
      # note:
    }
  end
  passports = Passport.create! seeds
  puts

  # Заполнить справочник водительских прав
  print ' • справочник водительских прав'
  seeds = (2*MAX_SEEDS).times.map do
    print '.'
    address = addresses.sample
    {
      # code:
      # name:
      country: address.country,
      serial: gen_num_str(4),
      number: gen_num_str(6),
      issued_by: "ГИБДД, #{address.region.name}, #{address.settlement.name}",
      issued_code: "#{gen_num_str(3)}-#{gen_num_str(3)}",
      issued_date: Faker::Date.between(20.year.ago, Date.today),
      valid_to: Faker::Date.between(5.year.ago, 15.year.from_now),
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
      birthday: Faker::Date.between(60.year.ago, 20.year.ago),
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
  seeds = clients.map do |client|
    print '.'
    username = Faker::Internet.username
    {
      code: username,
      name: username,
      email: Faker::Internet.safe_email(username),
      image: Faker::Avatar.image,
      client: client,
      note: Faker::Lorem.sentence
    }
  end
  users = User.create! seeds
  puts

 # Заполнить справочник бредов
  print ' • справочник брендов'
  seeds = MAX_SEEDS.times.inject([]) do |arr|
    print '.'
    begin
      make = Faker::Vehicle.make
      code = make[0..2].downcase
    end while (arr.any? { |h| h[:code] == code })
    arr << {
      code: code,
      name: make,
      note: Faker::Company.catch_phrase
    }
  end
  brands = Brand.create! seeds
  puts

  # Заполнить справочник производителей
  print ' • справочник производителей'
  seeds = MAX_SEEDS.times.map do
    print '.'
    manufacture = Faker::Vehicle.manufacture
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
  seeds = MAX_SEEDS.times.map do
    print '.'
    model = Faker::Vehicle.model
    brand = brands.sample
    {
      code: "#{model[0..2].downcase}-#{brand.code}",
      name: model,
      brand: brand,
      model_class: model_classes.sample,
      manufacture: manufactures.sample,
      body_type: body_types.sample,
      door_count: rand(2..7),
      seat_count: rand(2..7),
      style: Faker::Vehicle.style,
      transmission: Faker::Vehicle.transmission,
      drive_type: Faker::Vehicle.drive_type,
      fuel_type: Faker::Vehicle.fuel_type,
      engine: Faker::Vehicle.engine,
      engine_volume: rand(10..50).to_f / 10,
      specs: Faker::Vehicle.standard_specs,
      options: Faker::Vehicle.car_options,
      note: Faker::Company.catch_phrase
    }
  end
  models = Model.create! seeds
  puts

  # Заполнить справочник багажников автомобилей
  print ' • справочник багажников автомобилей'
  seeds = models.map do |model|
    rand(1..(trunk_types.size / 2)).times.inject([]) do |arr|
      print '.'
      type = nil
      # выбираем еще неиспользованный тип
      begin
        type = trunk_types.sample
      end while (arr.any? { |h| h[:trunk_type] == type })
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

  # Заполнить справочник коэффициентов тарифных планов
  print ' • справочник коэффициентов тарифных планов'
  seeds = models.map do |model|
    rental_types.map do |type|
      print '.'
      rate_name = "#{model.name}(#{type.name})"
      {
        code: "#{model.code}-#{type.code}",
        name: rate_name,
        model: model,
        rental_type: type,
        workweek: rand(5..15).to_f / 10,
        weekend: rand(5..15).to_f / 10,
        hour: rand(5..15).to_f / 10,
        note: rate_name
      }
    end
  end
  rental_rates = RentalRate.create! seeds.flatten
  puts

  # Заполнить связки коэффициентов и диапазонов дней
  print ' • связки коэффициентов и диапазонов дней'
  seeds = rental_rates.map do |rate|
    day_ranges.map do |range|
      print '.'
      rate_name = "#{rate.name}(#{range.name})"
      {
        code: "#{rate.code}-#{range.code}",
        name: rate_name,
        rental_rate: rate,
        day_range: range,
        rate: rand(80..100).to_f / 100,
        note: rate_name
      }
    end
  end
  range_rates = RangeRate.create! seeds.flatten
  puts

  # Заполнить справочник базовых цен для моделей (классов?)
  print ' • справочник базовых цен для моделей (классов?)'
  seeds = models.map do |model|
    price_name = "#{model.name}(#{model.model_class.name})"
    # Money принимает значение в копейках (ну не дурость?)
    # day_price = Money.new(rand(20..30) * 100 * 100)
    # km_price = Money.new(rand(50..100) / 10 * 100)
    day = rand(20..30) * 100
    km = rand(50..100) / 10
    print '.'
    {
      code: "#{model.code}-#{model.model_class.code}",
      name: price_name,
      model: model,
      model_class: model.model_class,
      # day_price: day_price.to_f,
      # forfeit_price: (day_price * 1.5).to_f,
      # earnest: (day_price * 3).to_f,
      # km_price: km_price.to_f,
      # km_over_price: (km_price * 1.5).to_f,
      # weekend_price: (day_price * 2 * 1.5).to_f,
      # workweek_price: (day_price * 4).to_f,
      # workday_price: (day_price * 0.9).to_f,
      day: day,
      forfeit: day * 1.5,
      earnest: day * 3,
      km: km,
      km_over: km * 1.5,
      weekend: day * 2 * 1.5,
      workweek: day * 4,
      workday: day * 0.9,
      note: price_name
    }
  end
  rental_prices = RentalPrice.create! seeds
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

end
