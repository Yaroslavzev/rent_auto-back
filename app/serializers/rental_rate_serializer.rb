# app/serializers/rental_rate_serializer.rb
class RentalRateSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :workweek, :weekend, :hour, :note
  has_one :model
  has_one :rental_type
end
