# app/serializers/barnd_serializer.rb
class BrandSerializer < ActiveModel::Serializer
  include FormatableSerializer

  attributes :id, :code, :name, :active, :note

  has_many :formats
end
