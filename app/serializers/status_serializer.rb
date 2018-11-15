# app/serializers/status_serializer.rb
class StatusSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :note
end
