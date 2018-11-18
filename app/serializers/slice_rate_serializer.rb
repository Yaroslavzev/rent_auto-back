# app/controllers/slice_rates_controller.rb
class SliceRateSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :rate, :note
  has_one :rental_rate
  has_one :days_slice
end
