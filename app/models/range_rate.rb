# app/models/range_rate.rb
class RangeRate < ApplicationRecord
  belongs_to :rental_rate
  belongs_to :days_range
end
