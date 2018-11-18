# app/serializers/rental_rate_serializer.rb
class RentalRateSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :km, :hour, :day, :note

  has_one :model_class
  has_one :rental_type

  has_many :range_rates
  has_many :slice_rates
end
