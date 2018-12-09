# app/controllers/calcs_controller.rb
class CalcsController < ApplicationController
  before_action :authenticate_user!, except: %i[cost]
  before_action :set_calc, only: %i[cost]
  attr_accessor :ranges_costs # , :model, :range

  DAYEND_SECS = Time.parse('23:59:59').seconds_since_midnight.seconds # конец суток в секундах (полные сутки - 1 сек)
  WEEK_DAYS = 7.days # дней в неделе

  RangeCost = Struct.new(:date_from, :time_from, :date_to, :time_to, :cost_type, :cost_id, :cost)

  # GET|POST /calcs/cost - калькулятор
  def cost
    if @model && @range
      @ranges_costs = calc_start
      total_cost = @ranges_costs.inject(0) { |total, rc| total += rc.cost.to_i  }
      ranges_costs = @ranges_costs.map { |rc| render_datetime(rc) }
      render json: { ranges: ranges_costs, total_cost: total_cost }, status: :ok
    else
      render json: { errors: { message: 'неправильные параметры' } }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calc
    # найти валидный параметр модели и загружаем его в @model
    @model = Model.find(calc_params[:model][:id]) if calc_params[:model] && calc_params[:model][:id]
    @model ||= Model.find_by(code: calc_params[:model][:code]) if calc_params[:model] && calc_params[:model][:code]
    @model ||= Model.find(calc_params[:model_id]) if calc_params[:model_id]
    @model ||= Model.find_by(code: calc_params[:model_code]) if calc_params[:model_code]

    # Rails.logger.info @model.as_json

    # для простоты пока берем самый первый тарифный план, он же “основной” (seed)
    @rental_type ||= RentalType.first

    # выбрать тариф
    @rental = @model.rentals.find_by(rental_type: @rental_type) unless @model.nil?

    # преорбразовать входной промежуток времени в формат удобный для вычислений
    @range = parse_datetime(calc_params[:range]) unless calc_params[:range].nil?
  end

  # Only allow a trusted parameter "white list" through.
  def calc_params
    params.fetch(:calc, {}).permit({ model: [:id, :code] }, :model_id, :model_code, range: [:date_from, :time_from, :date_to, :time_to])
  end

  # тут будет логика вычисления последовательни вычислений
  def calc_start
    calc_wdays(@range)
  end

  # калькулятор дней недели
  def calc_wdays(range)
    ranges = []
    rng = {}
    # преобразуем в формат datetime (нужно ли?)
    rng[:dt_from] = range[:date_from].to_datetime
    rng[:dt_from] += range[:time_from].seconds_since_midnight.seconds unless range[:time_from].nil?

    rng[:dt_to] = range[:date_to].to_datetime
    rng[:dt_to] += range[:time_to].nil? ? DAYEND_SECS : range[:time_to].seconds_since_midnight.seconds

    # пробегаемся по списку слайсов дней недели
    @rental.slice_rates.select { |s| s.days_slice.week }.each do |slice|
      wdays = slice.days_slice
      slc = {}

      # находим реальные даты среза для промежутка дней, после начальной даты промежутка
      slc[:dt_from] = (rng[:dt_from].to_date + wdays.day_from - rng[:dt_from].wday).to_datetime

      # если начальный день недели диапазона больше или равен и время больше чем в слайсе, то прибавляем неделю
      if rng[:dt_from].wday > wdays.day_from || rng[:dt_from].wday == wdays.day_from && rng[:dt_from].to_time > wdays.time_from
        slc[:dt_from] += WEEK_DAYS
      end
      slc[:dt_from] += wdays.time_from.seconds_since_midnight.seconds unless wdays.time_from.nil?

      slc[:dt_to] = (slc[:dt_from].to_date + wdays.day_to - wdays.day_from).to_datetime
      # опять же добавляем неделю, если дни недели в срезе приходятся на разные недели
      slc[:dt_to] += WEEK_DAYS if wdays.day_to < wdays.day_from
      slc[:dt_to] += wdays.time_to.nil? ? DAYEND_SECS : wdays.time_to.seconds_since_midnight.seconds

      # попал ли срез в промежуток дней
      if rng[:dt_from] <= slc[:dt_from] && slc[:dt_to] <= rng[:dt_to]
        # бинго, разбиваем наш промежуток на несколько
        ranges << RangeCost.new(range[:date_from], range[:time_from], slc[:dt_from].to_date, slc[:dt_from].to_time,
                                nil, nil, nil)
        ranges << RangeCost.new(slc[:dt_from].to_date, slc[:dt_from].to_time, slc[:dt_to].to_date, slc[:dt_to].to_time,
                                slice.class.table_name, slice.id, calc_cost(@rental, slice))
        ranges << RangeCost.new(slc[:dt_to].to_date, slc[:dt_to].to_time, range[:date_to], range[:time_to],
                                nil, nil, nil)
        break # одного достаточно пока (хотя и должен быть один)
      end
    end
    ranges
  end

  # подсчет: базовая цена * все коэффициенты (cut_rate - RangeRate или SliceRate, если nil, то не учитывается)
  def calc_cost(rental, cut_rate = nil)
    Rails.logger.info '#' * 80
    Rails.logger.info rental.day_cost
    Rails.logger.info cut_rate.rate
    Rails.logger.info '#' * 80

    cost = rental.day_cost
    cost *= cut_rate.rate unless cut_rate.nil?
  end

  # парсить строковые значения даты и времени
  def parse_datetime(str)
    hst = {}
    str.each_pair do |key, val|
      if /^dt_/.match?(key) && val.is_a?(String)
        hst[key.to_sym] = DateTime.parse(val)
      elsif /^date_/.match?(key) && val.is_a?(String)
        hst[key.to_sym] = Date.parse(val)
      elsif /^time_/.match?(key) && val.is_a?(String)
        hst[key.to_sym] = Time.parse(val)
      else
        hst[key.to_sym] = val
      end
    end
    hst
  end

  # рендерить строковые значения даты и времени
  def render_datetime(str)
    hst = {}
    str.each_pair do |key, val|
      if val.nil?
        hst[key.to_s] = nil
      else
        if /^dt_/.match?(key.to_s)  && val.is_a?(DateTime)
          hst[key.to_s] = val.to_datetime.to_s
        elsif /^date_/.match?(key.to_s)  && val.is_a?(Date)
          hst[key.to_s] = val.to_date.to_s
        elsif /^time_/.to_s.match?(key.to_s)  && val.is_a?(Time)
          hst[key.to_s] = val.to_time.to_s
        else
          hst[key.to_s] = val.to_s
        end
      end
    end
    hst
  end
end
