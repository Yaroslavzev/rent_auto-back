# app/models/days_range.rb
class DaysRange < ApplicationRecord
  has_many :range_rates, dependent: :destroy
end
