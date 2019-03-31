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

  # PATCH/PUT /info_models/1
  def update
    info_model_params
    true_slice = @slice_rates_JSON.each do |slice|
      @info_model.slice_rates.map do |object_for_upd|
        if slice["id"] == object_for_upd["id"]
          object_for_upd.update(slice.except(:id))
        end
      end
    end

    true_range = @range_rates_JSON.each do |range|
      @info_model.range_rates.map do |object_for_upd|
        if range["id"] == object_for_upd["id"]
          object_for_upd.update(range.except(:id))
        end
      end
    end

    if true_slice.all? && true_range.all?
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
  def info_model_params

    @model_JSON = params.require(:info_model).permit(:id, :name, :style, :engine_volume, :link, :note)
    @range_rates_JSON = params[:range_rates].map do |rates|
      rates.permit(:id,:code,:active, :model_class_id, :rental_type_id,:days_range_id, :rate, :note  )
    end
    @slice_rates_JSON = params[:slice_rates].map do |slice|
      slice.permit(:id,:code,:active, :model_class_id, :rental_type_id,:days_slice_id, :rate, :note  )
    end
  end
end
