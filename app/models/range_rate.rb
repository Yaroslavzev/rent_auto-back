# app/models/range_rate.rb
class RangeRate < ApplicationRecord
  belongs_to :model_class
  belongs_to :rental_type
  #belongs_to :days_range
end
