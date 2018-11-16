# app/models/driver_license.rb
class DriverLicense < ApplicationRecord
  belongs_to :country
end
