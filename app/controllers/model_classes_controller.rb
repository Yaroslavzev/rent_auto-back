# app/controllers/model_classes_controller.rb
class ModelClassesController < ApplicationController
  before_action :set_model_class, only: [:show, :update, :destroy]

  # GET /model_classes
  def index
    @model_classes = ModelClass.all

    render json: @model_classes
  end

  # GET /model_classes/1
  def show
    render json: @model_class
  end

  # POST /model_classes
  def create
    @model_class = ModelClass.new(model_class_params)

    if @model_class.save
      render json: @model_class, status: :created, location: @model_class
    else
      render json: @model_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /model_classes/1
  def update
    if @model_class.update(model_class_params)
      render json: @model_class
    else
      render json: @model_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /model_classes/1
  def destroy
    @model_class.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_class
      @model_class = ModelClass.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def model_class_params
      params.require(:model_class).permit(:code, :name, :note)
    end
end
