# app/models/slice_rate.rb
class SliceRate < ApplicationRecord
  belongs_to :model_class
  belongs_to :rental_type
  belongs_to :days_slice
end
