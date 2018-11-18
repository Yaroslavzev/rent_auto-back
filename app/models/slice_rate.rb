# app/models/slice_rate.rb
class SliceRate < ApplicationRecord
  belongs_to :rental_rate
  belongs_to :days_slice
end
