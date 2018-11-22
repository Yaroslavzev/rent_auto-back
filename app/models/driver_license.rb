# app/models/driver_license.rb
class DriverLicense < ApplicationRecord
  belongs_to :country

  has_one :client, dependent: :restrict_with_exception
end
