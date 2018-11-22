# app/serializers/district_serializer.rb
class DistrictSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :note

  has_one :region
  has_one :country
end
