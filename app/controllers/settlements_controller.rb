# app/controllers/settlements_controller.rb
class SettlementsController < ApplicationController
  before_action :set_settlement, only: [:show, :update, :destroy]

  # GET /settlements
  def index
    @settlements = Settlement.all

    render json: @settlements
  end

  # GET /settlements/1
  def show
    render json: @settlement
  end

  # POST /settlements
  def create
    @settlement = Settlement.new(settlement_params)

    if @settlement.save
      render json: @settlement, status: :created, location: @settlement
    else
      render json: @settlement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /settlements/1
  def update
    if @settlement.update(settlement_params)
      render json: @settlement
    else
      render json: @settlement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /settlements/1
  def destroy
    @settlement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_settlement
      @settlement = Settlement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def settlement_params
      params.require(:settlement).permit(:code, :name, :active, :status_id, :district_id, :region_id, :country_id, :note)
    end
end
