# app/controllers/range_rates_controller.rb
class RangeRatesController < ApplicationController
  before_action :set_range_rate, only: [:show, :update, :destroy]

  # GET /range_rates
  def index
    @range_rates = RangeRate.all

    render json: @range_rates
  end

  # GET /range_rates/1
  def show
    render json: @range_rate
  end

  # POST /range_rates
  def create
    @range_rate = RangeRate.new(range_rate_params)

    if @range_rate.save
      render json: @range_rate, status: :created, location: @range_rate
    else
      render json: @range_rate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /range_rates/1
  def update
    if @range_rate.update(range_rate_params)
      render json: @range_rate
    else
      render json: @range_rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /range_rates/1
  def destroy
    @range_rate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_range_rate
      @range_rate = RangeRate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def range_rate_params
      params.require(:range_rate).permit(:code, :name, :active, :rental_rate_id, :day_range_id, :rate, :note)
    end
end
