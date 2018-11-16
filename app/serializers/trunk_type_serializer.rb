# app/serializers/trunk_type_serializer.rb
class TrunkTypeSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :note
end
