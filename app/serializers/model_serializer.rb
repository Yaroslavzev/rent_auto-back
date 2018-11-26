# app/serializers/model_serializer.rb
class ModelSerializer < ActiveModel::Serializer
  include FormatableSerializer
  attributes :id, :code, :name, :active, :door_count, :seat_count, :style, :transmission,
             :drive_type, :fuel_type, :engine, :engine_volume, :specs, :options, :note

  has_one :model_class
  has_one :brand
  has_one :manufacture
  has_one :body_type

  has_one :rental_price
  # has_many :formats
end
