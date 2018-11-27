# app/serializers/rental_serializer.rb
class RentalSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :km_limit, :km_cost, :hour_cost, :day_cost, :forfeit, :earnest, :note

  has_one :model
  has_one :rental_type
end
