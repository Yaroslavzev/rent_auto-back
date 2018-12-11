# app/controllers/models_controller.rb
class InfoModelsController < ApplicationController
  before_action :set_info_model, only: %i[show update destroy]

  # GET /info_models
  def index
    @info_models = InfoModel.all

    render json: @info_models
  end

  # GET /info_models/1
  def show
    render json: @info_model
  end

  # PATCH/PUT /manufactures/1
  def update
    if @manufacture.update(manufacture_params)
      render json: @info_model
    else
      render json: @info_model.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_info_model
    @info_model = InfoModel.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def model_params
    params.require(:model).permit(:code, :name, :active, :brand_id, :manufacture_id, :body_type_id, :note, :link)
  end
end
