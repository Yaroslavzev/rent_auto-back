# app/controllers/manufactures_controller.rb
class ManufacturesController < ApplicationController
  before_action :set_manufacture, only: %i[show update destroy]

  # GET /manufactures
  def index
    @manufactures = Manufacture.all

    render json: @manufactures
  end

  # GET /manufactures/1
  def show
    render json: @manufacture
  end

  # POST /manufactures
  def create
    @manufacture = Manufacture.new(manufacture_params)

    if @manufacture.save
      render json: @manufacture, status: :created, location: @manufacture
    else
      render json: @manufacture.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /manufactures/1
  def update
    if @manufacture.update(manufacture_params)
      render json: @manufacture
    else
      render json: @manufacture.errors, status: :unprocessable_entity
    end
  end

  # DELETE /manufactures/1
  def destroy
    @manufacture.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_manufacture
    @manufacture = Manufacture.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def manufacture_params
    params.require(:manufacture).permit(:code, :name, :active, :brand_id, :country_id, :note)
  end
end
