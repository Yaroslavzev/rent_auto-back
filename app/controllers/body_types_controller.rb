# app/controllers/body_types_controller.rb
class BodyTypesController < ApplicationController
  before_action :set_body_type, only: %i[show update destroy]

  # GET /body_types
  def index
    @body_types = BodyType.all

    render json: @body_types
  end

  # GET /body_types/1
  def show
    render json: @body_type
  end

  # POST /body_types
  def create
    @body_type = BodyType.new(body_type_params)

    if @body_type.save
      render json: @body_type, status: :created, location: @body_type
    else
      render json: @body_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /body_types/1
  def update
    if @body_type.update(body_type_params)
      render json: @body_type
    else
      render json: @body_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /body_types/1
  def destroy
    @body_type.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_body_type
    @body_type = BodyType.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def body_type_params
    params.require(:body_type).permit(:code, :name, :active, :note)
  end
end
