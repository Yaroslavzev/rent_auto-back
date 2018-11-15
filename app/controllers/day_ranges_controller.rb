# app/controllers/day_ranges_controller.rb
class DayRangesController < ApplicationController
  before_action :set_day_range, only: [:show, :update, :destroy]

  # GET /day_ranges
  def index
    @day_ranges = DayRange.all

    render json: @day_ranges
  end

  # GET /day_ranges/1
  def show
    render json: @day_range
  end

  # POST /day_ranges
  def create
    @day_range = DayRange.new(day_range_params)

    if @day_range.save
      render json: @day_range, status: :created, location: @day_range
    else
      render json: @day_range.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /day_ranges/1
  def update
    if @day_range.update(day_range_params)
      render json: @day_range
    else
      render json: @day_range.errors, status: :unprocessable_entity
    end
  end

  # DELETE /day_ranges/1
  def destroy
    @day_range.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day_range
      @day_range = DayRange.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def day_range_params
      params.require(:day_range).permit(:code, :name, :active, :day_from, :day_to, :note)
    end
end
