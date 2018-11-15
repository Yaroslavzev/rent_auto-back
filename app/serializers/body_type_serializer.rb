# app/serializers/body_type_serializer.rb
class BodyTypeSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :note
end
