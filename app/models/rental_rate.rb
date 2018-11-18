# app/models/rental_rate.rb
class RentalRate < ApplicationRecord
  belongs_to :model_class
  belongs_to :rental_type

  has_many :range_rates, dependent: :destroy
  has_many :slice_rates, dependent: :destroy
end
