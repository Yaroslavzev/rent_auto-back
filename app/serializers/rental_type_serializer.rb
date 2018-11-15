# app/serializers/rental_type_serializer.rb
class RentalTypeSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :note
end
