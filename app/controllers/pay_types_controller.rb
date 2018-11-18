# app/controllers/pay_types_controller.rb
class PayTypesController < ApplicationController
  before_action :set_pay_type, only: %i[show update destroy]

  # GET /pay_types
  def index
    @pay_types = PayType.all

    render json: @pay_types
  end

  # GET /pay_types/1
  def show
    render json: @pay_type
  end

  # POST /pay_types
  def create
    @pay_type = PayType.new(pay_type_params)

    if @pay_type.save
      render json: @pay_type, status: :created, location: @pay_type
    else
      render json: @pay_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pay_types/1
  def update
    if @pay_type.update(pay_type_params)
      render json: @pay_type
    else
      render json: @pay_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pay_types/1
  def destroy
    @pay_type.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pay_type
    @pay_type = PayType.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def pay_type_params
    params.require(:pay_type).permit(:code, :name, :active, :tax, :rebate, :discount, :note)
  end
end
