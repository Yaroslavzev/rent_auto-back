# app/serializers/settlement_serializer.rb
class SettlementSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :note
  has_one :status
  has_one :district
  has_one :region
  has_one :country
end
