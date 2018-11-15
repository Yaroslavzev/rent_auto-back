# app/controllers/trunk_types_controller.rb
class TrunkTypesController < ApplicationController
  before_action :set_trunk_type, only: %i[show update destroy]

  # GET /trunk_types
  def index
    @trunk_types = TrunkType.all

    render json: @trunk_types
  end

  # GET /trunk_types/1
  def show
    render json: @trunk_type
  end

  # POST /trunk_types
  def create
    @trunk_type = TrunkType.new(trunk_type_params)

    if @trunk_type.save
      render json: @trunk_type, status: :created, location: @trunk_type
    else
      render json: @trunk_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trunk_types/1
  def update
    if @trunk_type.update(trunk_type_params)
      render json: @trunk_type
    else
      render json: @trunk_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trunk_types/1
  def destroy
    @trunk_type.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trunk_type
    @trunk_type = TrunkType.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def trunk_type_params
    params.require(:trunk_type).permit(:code, :name, :note)
  end
end
