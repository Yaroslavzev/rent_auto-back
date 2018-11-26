# app/controllers/rentals_controller.rb
class RentalsController < ApplicationController
  before_action :authenticate_user!, except: %i[calc]
  before_action :set_rental_params
  attr_accessor :range_fees # , :model, :range

  DAYEND_SECS = Time.parse('23:59:59').seconds_since_midnight.seconds # конец суток в секундах (полные сутки - 1 сек)
  WEEK_DAYS = 7.days # дней в неделе

  RangeCost = Struct.new(:date_from, :time_from, :date_to, :time_to, :cost_type, :cost_id, :cost)

  def calc
    if @model && @range
      @ranges_costs = calc_start
      render json: { ranges: render_datetime(@ranges_costs) }, status: :ok
    else
      render json: { errors: { message: 'неправильные параметры' } }, status: :unprocessable_entity
    end
  end

  private

  def calc_start
    calc_wdays(@range)
  end

  def calc_wdays(rng)
    # преобразуем в формат datetime (нужно ли?)
    rng_dt_from = rng[:date_from].to_datetime
    rng_dt_from += rng[:time_from].seconds_since_midnight.seconds unless rng[:time_from].nil?

    rng_dt_to = rng[:date_to].to_datetime
    rng_dt_to += rng[:time_to].nil? ? DAYEND_SECS : rng[:time_to].seconds_since_midnight.seconds

    # для простоты пока берем тип тарифа “основной”
    klass = @model.model_class
    type = RentalType.find_by(code: 'осн')
    rate = RentalRate.find_by(model_class: klass, rental_type: type)

    # пробегаемся по списку слайсов дней недели
    week_slices = rate.slice_rates.select { |s| s.days_slice.week }
    ranges = []
    week_slices.each do |slc|
      days_slice = slc.days_slice

      # находим реальные даты среза для диапазоны дней, после начальной даты диапазона
      slc_dt_from = (rng_dt_from.to_date + days_slice.day_from - rng_dt_from.wday).to_datetime
      # если начальный день недели диапазона больше или равен и время больше чем в слайсе, то прибавляем неделю
      slс_dt_from += WEEK_DAYS if rng_dt_from.wday > days_slice.day_from ||
                                  rng_dt_from.wday == days_slice.day_from &&
                                  rng_dt_from.to_time > days_slice.time_from
      slc_dt_from += days_slice.time_from.seconds_since_midnight.seconds

      slc_dt_to = (slc_dt_from.to_date + days_slice.day_to - days_slice.day_from).to_datetime
      # опять же добавляем неделю, если дни недели в срезе приходятся на разные недели
      slc_dt_to += WEEK_DAYS if days_slice.day_to < days_slice.day_from
      slc_dt_to += days_slice.time_to.seconds_since_midnight.seconds

      if rng_dt_from <= slc_dt_from && slc_dt_to <= rng_dt_to
        # бинго, разбиваем наш диапазон на несколько
        ranges << RangeCost.new(rng[:date_from], rng[:time_from], slc_dt_from.to_date, slc_dt_from.to_time,
                             nil, nil, nil)
        ranges << RangeCost.new(slc_dt_from.to_date, slc_dt_from.to_time, slc_dt_to.to_date, slc_dt_to.to_time,
                             slc.class.table_name, slc.id, calc_cost(@model, type, slc))
        ranges << RangeCost.new(slc_dt_to.to_date, slc_dt_to.to_time, rng[:date_to], rng[:time_to],
                             nil, nil, nil)
        break # одного достаточно пока
      end
    end
    ranges
  end

  # подсчет: базовая цена * все коэффициенты (cut_rate - RangeRate или SliceRate, если nil, то не учитывается)
  def calc_cost(model, rental_type, cut_rate = nil)
    rental_rate = RentalRate.find_by(rental_type: rental_type, model_class: model.model_class)
    cost = model.rental_price.day * rental_rate.day
    cost *= cut_rate.rate unless cut_rate.nil?
  end

  # парсить строковые значения даты и времени
  def parse_datetime(str)
    hst = {}
    str.each do |key, val|
      if key.match? /^dt_/
        hst[key.to_sym] = DateTime.parse(val)
      elsif key.match? /^date_/
        hst[key.to_sym] = Date.parse(val)
      elsif key.match? /^time_/
        hst[key.to_sym] = Time.parse(val)
      else
        hst[key.to_sym] = val
      end
    end
    hst
  end

  def render_datetime(str)
    hst = {}
    str.each do |key, val|
      if key.to_s.match? /^dt_/
        hst[key.to_s] = val.to_datetime.to_s
      elsif key.to_s.match? /^date_/
        hst[key.to_s] = val.to_date.to_s
      elsif key.to_s.match? /^time_/
        hst[key.to_s] = val.to_time.to_s
      else
        hst[key.to_s] = val.to_s
      end
    end
    hst
  end

  def set_rental_params
    # найти валидный параметр модели и загружаем его в @model
    @model = Model.find(rental_params[:model][:id]) unless rental_params[:model].nil? ||
                                                           !rental_params[:model].is_a?(Hash) ||
                                                           rental_params[:model][:id].nil?
    @model ||= Model.find(rental_params[:model_id]) unless rental_params[:model_id].nil?
    @model ||= Model.find_by(code: rental_params[:model_code])

    # преорбразовать входной промежуток времени в формат удобный для вычислений
    @range = parse_datetime(rental_params[:range])

    Rails.logger.info '#' * 80
    Rails.logger.info @range.inspect
    Rails.logger.info '#' * 80
  end

  # Only allow a trusted parameter "white list" through.
  def rental_params
    params.fetch(:rental, {}).permit(:model, :model_id, :model_code, range: [:date_from, :time_from, :date_to, :time_to])
  end
end
