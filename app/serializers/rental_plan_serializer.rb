# app/serializers/rental_plan_serializer.rb
class RentalPlanSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :note
  has_one :model
  has_one :model_class
  has_one :rental_type
  has_one :rental_rate
  has_one :rental_price
end
