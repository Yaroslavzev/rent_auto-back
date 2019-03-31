# app/models/model.rb
class Model < ApplicationRecord
  # шаблон генерации поля full_name
  FULL_NAME = ERB.new(Rails.configuration.model_full)

  belongs_to :model_class
  belongs_to :brand
  belongs_to :manufacture
  belongs_to :body_type

  has_many :rentals, dependent: :destroy

  def range_rates
     Model.find(id).rentals.find_by(rental_type: 1).range_rates
  end

  def slice_rates
     Model.find(id).rentals.find_by(rental_type: 1).slice_rates
  end

  def rental
    Rental.find_by(model: id)
  end

  def range_rates_own
    self.rentals.find_by(rental_type: 1).range_rates
  end

  def slice_rates_own #как лучше назвать метод, чтобы не было конфликтов с ActiveRecord?
   self.rentals.find_by(rental_type: 1).slice_rates
  end

  # покамест аттрибут full_name будет виртуальным и read-only
  def full_name
    FULL_NAME.result_with_hash(brand: brand.name, model: name, volume: engine_volume, style: style,
                               cls: model_class.name)
  end

  # has_many_attached :images
end
