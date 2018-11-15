# app/serializers/trunk_serializer.rb
class TrunkSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :price, :note
  has_one :model
  has_one :trunk_type
end
