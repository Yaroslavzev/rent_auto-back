# app/serializers/passport_serializer.rb
class PassportSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :verified, :series, :number, :issued_by, :issued_code, :issued_date, :valid_to, :note
  has_one :country
  has_one :address
end
