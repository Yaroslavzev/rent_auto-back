# app/serializers/spot_serializer.rb
class SpotSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :note
  has_one :address
end
