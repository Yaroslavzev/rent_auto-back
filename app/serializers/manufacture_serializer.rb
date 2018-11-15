# app/serializers/manufacture_serializer.rb
class ManufactureSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :note
  has_one :brand
  has_one :country
end
