# app/models/rental.rb
class Rental < ApplicationRecord
  belongs_to :model
  belongs_to :rental_type

  has_one :model_class, through: :model

  has_many :range_rates, ->(rental) { where(model_class: rental.model.model_class) }, through: :rental_type
  has_many :slice_rates, ->(rental) { where(model_class: rental.model.model_class) }, through: :rental_type

  attribute :km_cost, :money
  attribute :hour_cost, :money
  attribute :day_cost, :money
  attribute :forfeit, :money
  attribute :earnest, :money
end
