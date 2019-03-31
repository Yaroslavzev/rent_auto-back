# app/serializers/model_serializer.rb
class ModelSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :door_count, :seat_count, :style, :transmission,
             :drive_type, :fuel_type, :engine, :engine_volume, :specs, :options, :note, :link, :full_name

  has_one :model_class
  has_one :brand
  has_one :manufacture
  has_one :body_type

  has_many :rentals
end
