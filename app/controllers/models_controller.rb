# app/controllers/models_controller.rb
class ModelsController < ApplicationController
  before_action :set_model, only: %i[show update destroy]


  # GET /models
  def index
    @models = Model.all

    render json: @models
  end

  # GET /models/1
  def show
    render json: @model
  end

  # POST /models
  def create
    model_params
    @model = Model.new(@model_JSON.except(:id))
    @rental = @model.rentals.new(@rental_JSON.except(:id))
    @rental.rental_type = RentalType.find(1)
    @model.model_class = ModelClass.new(@model_class_JSON.except(:id))
    @model.brand = Brand.find_or_create_by(@brand_JSON.except(:id))
    @model.manufacture = Manufacture.new(code: "не используется", name:"не используется", note:"не используется" )
    @model.body_type = BodyType.new(code: "не используется", name:"не используется", note:"не используется" )
    

    if @model.save
      render json: @model, status: :created, location: @model
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /models/1
  def update

    model_params
    if @model.update(@model_JSON) && @model.rentals.update(@rental_JSON) && @model.model_class.update(@model_class_JSON) && @model.brand.update(@brand_JSON)
      render json: @model
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /models/1
  def destroy
    if @model.destroy
      render json: {
      status: 200,
      message: "Successfully deleted"
    }.to_json
    else
      render json: @model.errors, status: :unprocessable_entity
end

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_model
    @model = Model.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def model_params
    @model_JSON = params[:model].permit(:id, :name, :style, :engine_volume, :link, :note)
    @brand_JSON = params[:brand].permit(:id, :name)
    @rental_JSON = params[:rentals][0].permit(:id, :day_cost)
    @model_class_JSON = params[:model_class].permit(:id,:name)
  end
end
