# app/serializers/slice_rate_serializer.rb
class SliceRatesController < ApplicationController
  before_action :set_slice_rate, only: [:show, :update, :destroy]

  # GET /slice_rates
  def index
    @slice_rates = SliceRate.all

    render json: @slice_rates
  end

  # GET /slice_rates/1
  def show
    render json: @slice_rate
  end

  # POST /slice_rates
  def create
    @slice_rate = SliceRate.new(slice_rate_params)

    if @slice_rate.save
      render json: @slice_rate, status: :created, location: @slice_rate
    else
      render json: @slice_rate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /slice_rates/1
  def update
    if @slice_rate.update(slice_rate_params)
      render json: @slice_rate
    else
      render json: @slice_rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /slice_rates/1
  def destroy
    @slice_rate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slice_rate
      @slice_rate = SliceRate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def slice_rate_params
      params.require(:slice_rate).permit(:code, :name, :active, :rental_rate_id, :days_slice_id, :rate, :note)
    end
end
