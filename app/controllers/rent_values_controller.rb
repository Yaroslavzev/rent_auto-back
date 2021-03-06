class RentValuesController < ApplicationController
  def index
    @calculation = ::CalculatorOfRent::Calculator.new(post_params['start_time'], post_params['end_time'], post_params['model'])

    @cost = @calculation.logic_calculator.to_i
    render json: @cost
  end

  private

  def post_params
    params.permit(:start_time, :end_time, :model)
  end
end
