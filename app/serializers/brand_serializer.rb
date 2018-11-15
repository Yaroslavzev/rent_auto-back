# app/serializers/barnd_serializer.rb
class BrandSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :note
end
