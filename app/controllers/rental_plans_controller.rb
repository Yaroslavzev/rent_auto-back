# app/controllers/rental_plans_controller.rb
class RentalPlansController < ApplicationController
  before_action :set_rental_plan, only: %i[show update destroy]

  # GET /rental_plans
  def index
    @rental_plans = RentalPlan.all

    render json: @rental_plans
  end

  # GET /rental_plans/1
  def show
    render json: @rental_plan
  end

  # POST /rental_plans
  def create
    @rental_plan = RentalPlan.new(rental_plan_params)

    if @rental_plan.save
      render json: @rental_plan, status: :created, location: @rental_plan
    else
      render json: @rental_plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rental_plans/1
  def update
    if @rental_plan.update(rental_plan_params)
      render json: @rental_plan
    else
      render json: @rental_plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rental_plans/1
  def destroy
    @rental_plan.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rental_plan
    @rental_plan = RentalPlan.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def rental_plan_params
    params.require(:rental_plan).permit(:code, :name, :active, :model_id, :model_class_id, :rental_type_id, :rental_rate_id,
                                        :rental_price_id, :note)
  end
end
