# app/models/district.rb
class District < ApplicationRecord
  belongs_to :region
  belongs_to :country
end
