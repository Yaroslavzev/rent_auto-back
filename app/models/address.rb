# app/models/address.rb
class Address < ApplicationRecord
  belongs_to :country
  belongs_to :region
  belongs_to :district
  belongs_to :settlement
end
