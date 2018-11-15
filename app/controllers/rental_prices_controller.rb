# app/controllers/rental_prices_controller.rb
class RentalPricesController < ApplicationController
  before_action :set_rental_price, only: [:show, :update, :destroy]

  # GET /rental_prices
  def index
    @rental_prices = RentalPrice.all

    render json: @rental_prices
  end

  # GET /rental_prices/1
  def show
    render json: @rental_price
  end

  # POST /rental_prices
  def create
    @rental_price = RentalPrice.new(rental_price_params)

    if @rental_price.save
      render json: @rental_price, status: :created, location: @rental_price
    else
      render json: @rental_price.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rental_prices/1
  def update
    if @rental_price.update(rental_price_params)
      render json: @rental_price
    else
      render json: @rental_price.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rental_prices/1
  def destroy
    @rental_price.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_price
      @rental_price = RentalPrice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rental_price_params
      params.require(:rental_price).permit(:code, :name, :active, :model_id, :model_class_id, :hour, :day, :forfeit, :earnest, :km, :km_over, :note)
    end
end
