# app/models/rental_type.rb
class RentalType < ApplicationRecord
  has_many :rental_rates, dependent: :restrict_with_exception
  has_many :rental_plans, dependent: :nullify
end
