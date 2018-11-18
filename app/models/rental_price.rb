# app/models/rental_price.rb
class RentalPrice < ApplicationRecord
  belongs_to :model
  belongs_to :model_class

  attribute :km, :money
  attribute :hour, :money
  attribute :day, :money
  attribute :forfeit, :money
  attribute :earnest, :money
end
