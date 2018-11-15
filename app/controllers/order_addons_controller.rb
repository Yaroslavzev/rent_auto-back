# app/controllers/order_addons_controller.rb
class OrderAddonsController < ApplicationController
  before_action :set_order_addon, only: [:show, :update, :destroy]

  # GET /order_addons
  def index
    @order_addons = OrderAddon.all

    render json: @order_addons
  end

  # GET /order_addons/1
  def show
    render json: @order_addon
  end

  # POST /order_addons
  def create
    @order_addon = OrderAddon.new(order_addon_params)

    if @order_addon.save
      render json: @order_addon, status: :created, location: @order_addon
    else
      render json: @order_addon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_addons/1
  def update
    if @order_addon.update(order_addon_params)
      render json: @order_addon
    else
      render json: @order_addon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_addons/1
  def destroy
    @order_addon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_addon
      @order_addon = OrderAddon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_addon_params
      params.require(:order_addon).permit(:code, :name, :active, :order_id, :addition_id, :price, :note)
    end
end
