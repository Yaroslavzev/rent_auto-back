# app/serializers/addition_serializer.rb
class AdditionSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :service, :price, :note
end
