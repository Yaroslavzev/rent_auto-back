# app/controllers/slice_rates_controller.rb
class SliceRateSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :rate, :note

  has_one :model_class
  has_one :rental_type
  has_one :days_slice
end
