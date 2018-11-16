# app/controllers/driver_licenses_controller.rb
class DriverLicensesController < ApplicationController
  before_action :set_driver_license, only: [:show, :update, :destroy]

  # GET /driver_licenses
  def index
    @driver_licenses = DriverLicense.all

    render json: @driver_licenses
  end

  # GET /driver_licenses/1
  def show
    render json: @driver_license
  end

  # POST /driver_licenses
  def create
    @driver_license = DriverLicense.new(driver_license_params)

    if @driver_license.save
      render json: @driver_license, status: :created, location: @driver_license
    else
      render json: @driver_license.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /driver_licenses/1
  def update
    if @driver_license.update(driver_license_params)
      render json: @driver_license
    else
      render json: @driver_license.errors, status: :unprocessable_entity
    end
  end

  # DELETE /driver_licenses/1
  def destroy
    @driver_license.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver_license
      @driver_license = DriverLicense.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def driver_license_params
      params.require(:driver_license).permit(:code, :name, :active, :verified, :country_id, :series, :number, :category, :issued_by, :issued_code, :issued_date, :valid_to, :note)
    end
end
