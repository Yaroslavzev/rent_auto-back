# app/serializers/range_rate_serializer.rb
class RangeRateSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :rate, :note
  has_one :rental_rate
  has_one :day_range
end
