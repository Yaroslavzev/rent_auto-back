# app/serializers/rental_rate_serializer.rb
class RentalRateSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :workweek, :weekend, :hour, :note
  has_one :model_class
  has_one :rental_type
end
