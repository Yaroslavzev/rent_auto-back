# app/serializers/range_rate_serializer.rb
class RangeRateSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :rate, :note

  has_one :model_class
  has_one :rental_type
  has_one :days_range
end
