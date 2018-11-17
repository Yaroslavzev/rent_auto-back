# app/controllers/rental_rates_controller.rb
class RentalRatesController < ApplicationController
  before_action :set_rental_rate, only: %i[show update destroy]

  # GET /rental_rates
  def index
    @rental_rates = RentalRate.all

    render json: @rental_rates
  end

  # GET /rental_rates/1
  def show
    render json: @rental_rate
  end

  # POST /rental_rates
  def create
    @rental_rate = RentalRate.new(rental_rate_params)

    if @rental_rate.save
      render json: @rental_rate, status: :created, location: @rental_rate
    else
      render json: @rental_rate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rental_rates/1
  def update
    if @rental_rate.update(rental_rate_params)
      render json: @rental_rate
    else
      render json: @rental_rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rental_rates/1
  def destroy
    @rental_rate.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rental_rate
    @rental_rate = RentalRate.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def rental_rate_params
    params.require(:rental_rate).permit(:code, :name, :active, :model_class_id, :rental_type_id, :workweek, :weekend,
                                        :hour, :note)
  end
end
