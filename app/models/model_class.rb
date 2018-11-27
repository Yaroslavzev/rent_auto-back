# app/models/model_class.rb
class ModelClass < ApplicationRecord
  has_many :models
  has_many :rentals
  has_many :range_rates
  has_many :slice_rates
end
