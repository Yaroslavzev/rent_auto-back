# app/serializers/rental_price_serializer.rb
class RentalPriceSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :day, :forfeit, :earnest, :km, :km_over, :weekend, :workweek, :workday, :note
  has_one :model
  has_one :model_class
end
