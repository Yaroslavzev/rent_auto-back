# app/serializers/model_class_serializer.rb
class ModelClassSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :note
end
