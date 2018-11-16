# app/serializers/driver_license_serializer.rb
class DriverLicenseSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :verified, :series, :number, :category, :issued_by, :issued_code, :issued_date, :valid_to, :note
  has_one :country
end
