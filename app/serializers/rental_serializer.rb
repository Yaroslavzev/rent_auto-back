# app/serializers/rental_serializer.rb
class RentalSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :km_limit, :km_cost, :hour_cost, :day_cost, :forfeit, :earnest, :note

  has_one :model
  has_one :rental_type

  has_one :model_class, through: :model

  has_many :range_rates do
    RangeRate.where(model_class: object.model.model_class, rental_type: object.rental_type)
  end
  has_many :slice_rates do
    SliceRate.where(model_class: object.model.model_class, rental_type: object.rental_type)
  end
end
