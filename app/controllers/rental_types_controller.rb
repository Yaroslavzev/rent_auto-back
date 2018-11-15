# app/controllers/rental_types_controller.rb
class RentalTypesController < ApplicationController
  before_action :set_rental_type, only: [:show, :update, :destroy]

  # GET /rental_types
  def index
    @rental_types = RentalType.all

    render json: @rental_types
  end

  # GET /rental_types/1
  def show
    render json: @rental_type
  end

  # POST /rental_types
  def create
    @rental_type = RentalType.new(rental_type_params)

    if @rental_type.save
      render json: @rental_type, status: :created, location: @rental_type
    else
      render json: @rental_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rental_types/1
  def update
    if @rental_type.update(rental_type_params)
      render json: @rental_type
    else
      render json: @rental_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rental_types/1
  def destroy
    @rental_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_type
      @rental_type = RentalType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rental_type_params
      params.require(:rental_type).permit(:code, :name, :note)
    end
end
