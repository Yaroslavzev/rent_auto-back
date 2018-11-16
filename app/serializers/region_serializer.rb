# app/serializers/region_serializer.rb
class RegionSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :note
  has_one :country
end
