# app/models/rental_rate.rb
class RentalRate < ApplicationRecord
  belongs_to :model_class
  belongs_to :rental_type
end
