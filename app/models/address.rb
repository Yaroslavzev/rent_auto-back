# app/models/address.rb
class Address < ApplicationRecord
  belongs_to :country
  belongs_to :region
  belongs_to :district
  belongs_to :settlement

  has_one :passport, dependent: :restrict_with_exception
  has_one :client, dependent: :restrict_with_exception

  has_many :spots, dependent: :nullify
end
