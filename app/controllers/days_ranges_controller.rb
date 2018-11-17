# app/controllers/days_ranges_controller.rb
class DaysRangesController < ApplicationController
  before_action :set_days_range, only: %i[show update destroy]

  # GET /days_ranges
  def index
    @days_ranges = DaysRange.all

    render json: @days_ranges
  end

  # GET /days_ranges/1
  def show
    render json: @days_range
  end

  # POST /days_ranges
  def create
    @days_range = DaysRange.new(days_range_params)

    if @days_range.save
      render json: @days_range, status: :created, location: @days_range
    else
      render json: @days_range.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /days_ranges/1
  def update
    if @days_range.update(days_range_params)
      render json: @days_range
    else
      render json: @days_range.errors, status: :unprocessable_entity
    end
  end

  # DELETE /days_ranges/1
  def destroy
    @days_range.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_days_range
    @days_range = DaysRange.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def days_range_params
    params.require(:days_range).permit(:code, :name, :active, :days_from, :days_to, :note)
  end
end
