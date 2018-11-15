# app/serializers/pay_type_serializer.rb
class PayTypeSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :tax, :rebate, :discount, :note
end
