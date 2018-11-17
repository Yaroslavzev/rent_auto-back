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
      @rent_days = ((@end_time - @start_time)/1.day).to_i + 1

      if @rent_days <= 6
        if work_days_of_week?
          if @rent_days === NUMBER_OF_WORK_DAYS_OF_WEEK + 1
            @cost = @costworkday + @cost1
          else
            @cost = @costworkday
          end
        elsif weekend_of_week?
          @cost = (@rent_days - NUMBER_OF_WEEKEND_DAYS) * @cost1 + @costweekend
        else
          @cost = @rent_days * @cost1
        end
      elsif @rent_days <= 20
        @cost = @rent_days * @cost2
      else
        @cost = @rent_days * @cost3
      end
    end

    private

    NUMBER_OF_WORK_DAYS_OF_WEEK = 5
    NUMBER_OF_WEEKEND_DAYS = 2
    
    def model_cost
      @cost1 = 1000
      @cost2 = 900
      @cost3 = 800
      @costworkday = 4500
      @costweekend = 1800

    end

    def work_days_of_week?
      (@start_time_day..@end_time_day).select {|d| (1..5).include?(d.wday)}.size === NUMBER_OF_WORK_DAYS_OF_WEEK
    end


    def weekend_of_week?
      (@start_time_day..@end_time_day).select {|d| 6.eql?(d.wday) or 0.eql?(d.wday) }.size === NUMBER_OF_WEEKEND_DAYS
    end

  end
end
