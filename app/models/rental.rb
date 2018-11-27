# app/models/rental.rb
class Rental < ApplicationRecord
  belongs_to :model
  belongs_to :model_class
  belongs_to :rental_type

  # has_one :model_class, through: :model

  has_many :range_rates, -> { joins(:rental_type, :model_class) }
  # has_many :slice_rates, -> { joins(:model_class).where('slice_rates.rental_type_id = model_classes.id') }, through: :rental_type
  has_many :slice_rates, -> { joins(:model_class).where(model_class: 'slice_rates.model_classes_id') }, through: :rental_type

  attribute :km_cost, :money
  attribute :hour_cost, :money
  attribute :day_cost, :money
  attribute :forfeit, :money
  attribute :earnest, :money
end
