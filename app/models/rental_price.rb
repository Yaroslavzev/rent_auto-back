# app/models/rental_price.rb
class RentalPrice < ApplicationRecord
  belongs_to :model
  belongs_to :model_class

  attribute :day, :money
  attribute :forfeit, :money
  attribute :earnest, :money
  attribute :km, :money
  attribute :weekend, :money
  attribute :workweek, :money
  attribute :workday, :money
end
