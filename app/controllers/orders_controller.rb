# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show update destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def order_params
    params.require(:order).permit(:code, :name, :active, :status, :vehicle_id, :model_id, :client_id, :issue_spot_id,
                                  :return_spot_id, :date_from, :time_from, :date_to, :time_to, :days_count, :days_over,
                                  :rental_plan_id, :pay_type_id, :weekend_fee, :workweek_fee, :days_fee, :addons_fee,
                                  :forfeit_fee, :discouts, :total_fee, :total_paid, :paid_full, :note)
  end
end
