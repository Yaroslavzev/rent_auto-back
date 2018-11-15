# app/serializers/order_addon_serializer.rb
class OrderAddonSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :price, :note
  has_one :order
  has_one :addition
end
