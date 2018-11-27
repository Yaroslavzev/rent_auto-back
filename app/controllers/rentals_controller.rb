# app/controllers/rentals_controller.rb
class RentalsController < ApplicationController
  before_action :set_rental, only: %i[show update destroy]

  # GET /rentals
  def index
    @rentals = Rental.all

    render json: @rentals
  end

  # GET /rentals/1
  def show
    render json: @rental
  end

  # POST /rentals
  def create
    @rental = Rental.new(rental_params)

    if @rental.save
      render json: @rental, status: :created, location: @rental
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rentals/1
  def update
    if @rental.update(rental_params)
      render json: @rental
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rentals/1
  def destroy
    @rental.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rental
    @rental = Rental.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def rental_params
    params.require(:rental).permit(:code, :name, :model_id, :rental_type_id, :km_limit, :km_cost, :hour_cost,
                                   :day_cost, :forfeit, :earnest, :note)
  end
end
