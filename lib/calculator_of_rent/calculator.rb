module CalculatorOfRent
  class Calculator
    def initialize(start_time, end_time, model)
      @start_time = start_time.to_time
      @end_time = end_time.to_time
      @model = model
      @start_time_day = start_time.to_date
      @end_time_day = end_time.to_date
    end

    def logic_calculator
      model_cost
      @rent_days = ((@end_time - @start_time)/ 1.day).to_f.ceil


      @cost = if @rent_days <= DAYS_OF_FIRST_RANGE
                #puts work_days_of_week?
                if work_days_of_week?
                  if @rent_days === NUMBER_OF_WORK_DAYS_OF_WEEK + 1
                    @rates[4] + @rates[0]
                  else
                    @rates[4]
                  end
                elsif weekend_of_week?
                  (@rent_days - NUMBER_OF_WEEKEND_DAYS) * @rates[0] + @rates[3]
                else
                  @rent_days * @rates[0]
                        end
              elsif @rent_days <= DAYS_OF_SECOND_RANGE
                @rent_days * @rates[1]
              else
                @rent_days * @rates[2]
              end
    end

    private

    NUMBER_OF_WORK_DAYS_OF_WEEK = 5
    NUMBER_OF_WEEKEND_DAYS = 2

    DAYS_OF_FIRST_RANGE = 6
    DAYS_OF_SECOND_RANGE = 20

    def model_cost
      @rates = Model.find(@model).rentals.find_by(rental_type: 1).range_rates.map {|object| (object.attributes["rate"] * Rental.find_by(model_id: @model).attributes["day_cost"]).to_i}

      @rates += Model.find(@model).rentals.find_by(rental_type: 1).slice_rates.map {|object| (object.attributes["rate"] * Rental.find_by(model_id: @model).attributes["day_cost"]).to_i}
    end

    def work_days_of_week?
      (@start_time_day..@end_time_day).select { |d| (1..5).cover?(d.wday) }.size === NUMBER_OF_WORK_DAYS_OF_WEEK
    end

    def weekend_of_week?
      (@start_time_day..@end_time_day).select { |d| 6.eql?(d.wday) || 0.eql?(d.wday) }.size === NUMBER_OF_WEEKEND_DAYS
    end
  end
end
