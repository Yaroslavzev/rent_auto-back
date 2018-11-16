# app/serializers/vehicle_serializer.rb
class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :garage_no, :state_no, :vin, :release, :mileage, :color, :specs, :options, :note

  has_one :model
  has_one :trunk

  attribute :release do object.release.strftime("%Y-%m") end

end
