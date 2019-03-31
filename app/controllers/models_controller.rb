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

    @range_rates_JSON = [{code: "д1-6",  name: "от 1 до 6 дней",  rate: 0.96, note: "от 1 до 6 дней"},
                         {code: "д7-20", name: "от 7 до 20 дней", rate: 0.93, note: "от 7 до 20"},
                         {code: "д21+",  name: "от 21 дней",      rate: 0.92, note: "от 21 дней"}]

    @slice_rates_JSON = [{code: "в/д", name: "выходные дни", rate: 0.93, note: "Выходные дни"},
                         {code: "р/д", name: "рабочие дни",  rate: 0.87, note: "Рабочие дни"}]

    #@rental.slice_rates.new(@slice_rates_JSON)

    @model = Model.new(@model_JSON.except(:id))
    #@rental = @model.rentals.build(@rental_JSON.except(:id), rental_type: RentalType.find(1), model_class: ModelClass.new(@model_class_JSON.except(:id)))
    @rental = @model.rentals.new(day_cost: @rental_JSON[:day_cost],rental_type: RentalType.find(1), model_class: ModelClass.new(@model_class_JSON.except(:id)))

    @model.model_class = @rental.model_class
    @model.brand = Brand.find_or_create_by(@brand_JSON.except(:id))
    @model.manufacture = Manufacture.new(code: "не используется", name:"не используется", note:"не используется" )
    @model.body_type = BodyType.new(code: "не используется", name:"не используется", note:"не используется" )



    if @model.save
      @rangerates = @model.rentals.find_by(rental_type: 1).range_rates.new(@range_rates_JSON.map do |object|
        {code: object[:code],
         name: object[:name],
          rate: object[:rate],
          note: object[:note],
          model_class: @rental.model_class,
          rental_type: RentalType.find(1)}
        end)
      @rangerates.each { |object|  object.save}

      @slicerates = @model.rentals.find_by(rental_type: 1).slice_rates.new(@slice_rates_JSON.map do |object|
        {code: object[:code],
         name: object[:name],
          rate: object[:rate],
          note: object[:note],
          model_class: @rental.model_class,
          rental_type: RentalType.find(1)}
        end)

      @slicerates.each { |object|  object.save}
      
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
