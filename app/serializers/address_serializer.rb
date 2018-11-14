# app/serializers/address_serializer.rb
class AddressSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :checked, :postcode, :street, :house, :flat, :address1, :address2, :note
  has_one :country
  has_one :region
  has_one :district
  has_one :settlement
end
