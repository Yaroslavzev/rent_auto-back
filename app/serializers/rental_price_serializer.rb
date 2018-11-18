# app/serializers/rental_price_serializer.rb
class RentalPriceSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :km_limit, :km, :hour, :day, :forfeit, :earnest, :note
  has_one :model
  has_one :model_class
end
