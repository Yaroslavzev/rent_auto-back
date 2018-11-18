# app/controllers/days_slices_controller.rb
class DaysSlicesController < ApplicationController
  before_action :set_days_slice, only: %i[show update destroy]

  # GET /days_slices
  def index
    @days_slices = DaysSlice.all

    render json: @days_slices
  end

  # GET /days_slices/1
  def show
    render json: @days_slice
  end

  # POST /days_slices
  def create
    @days_slice = DaysSlice.new(days_slice_params)

    if @days_slice.save
      render json: @days_slice, status: :created, location: @days_slice
    else
      render json: @days_slice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /days_slices/1
  def update
    if @days_slice.update(days_slice_params)
      render json: @days_slice
    else
      render json: @days_slice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /days_slices/1
  def destroy
    @days_slice.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_days_slice
    @days_slice = DaysSlice.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def days_slice_params
    params.require(:days_slice).permit(:code, :name, :active, :week, :mon_from, :day_from, :time_from, :mon_to,
                                       :day_to, :time_to, :note)
  end
end
