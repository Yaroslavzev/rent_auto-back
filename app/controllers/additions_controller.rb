# app/controllers/additions_controller.rb
class AdditionsController < ApplicationController
  before_action :set_addition, only: [:show, :update, :destroy]

  # GET /additions
  def index
    @additions = Addition.all

    render json: @additions
  end

  # GET /additions/1
  def show
    render json: @addition
  end

  # POST /additions
  def create
    @addition = Addition.new(addition_params)

    if @addition.save
      render json: @addition, status: :created, location: @addition
    else
      render json: @addition.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /additions/1
  def update
    if @addition.update(addition_params)
      render json: @addition
    else
      render json: @addition.errors, status: :unprocessable_entity
    end
  end

  # DELETE /additions/1
  def destroy
    @addition.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addition
      @addition = Addition.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def addition_params
      params.require(:addition).permit(:code, :name, :active, :service, :price, :note)
    end
end
