# app/serializers/manufacture_serializer.rb
class ManufactureSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :note
  has_one :brand
  has_one :country
end
