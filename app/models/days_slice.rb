# spec/models/days_slice_spec.rb
class DaysSlice < ApplicationRecord
  has_many :slice_rates, dependent: :destroy
end
