# app/models/rental_type.rb
class RentalType < ApplicationRecord
  has_many :rentals, dependent: :destroy

  has_many :range_rates, dependent: :destroy
  has_many :slice_rates, dependent: :destroy

  has_many :orders, dependent: :nullify
end
