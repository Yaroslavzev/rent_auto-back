# app/controllers/trunk_controller.rb
class TrunksController < ApplicationController
  before_action :set_trunk, only: %i[show update destroy]

  # GET /trunks
  def index
    @trunks = Trunk.all

    render json: @trunks
  end

  # GET /trunks/1
  def show
    render json: @trunk
  end

  # POST /trunks
  def create
    @trunk = Trunk.new(trunk_params)

    if @trunk.save
      render json: @trunk, status: :created, location: @trunk
    else
      render json: @trunk.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trunks/1
  def update
    if @trunk.update(trunk_params)
      render json: @trunk
    else
      render json: @trunk.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trunks/1
  def destroy
    @trunk.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trunk
    @trunk = Trunk.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def trunk_params
    params.require(:trunk).permit(:code, :name, :trunk_type_id, :model_id, :note)
  end
end
