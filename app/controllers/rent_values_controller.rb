class RentValuesController < ApplicationController

  def index

    @calculation =  ::CalculatorOfRent::Calculator.new(post_params['start_time'], post_params['end_time'],post_params['model'])

    @calculation.model_cost
    @cost = @calculation.logic_calculator
    render json: @cost

  end
  private
  def post_params
    params.permit(:start_time,:end_time,:model)
  end
end
