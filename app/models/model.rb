# app/models/model.rb
class Model < ApplicationRecord
  belongs_to :model_class
  belongs_to :brand
  belongs_to :manufacture
  belongs_to :body_type

  has_many :rentals, dependent: :destroy
  has_many :formats, -> { select 'formats.*' }, as: :formatable, primary_key: :table_name


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
  
  # has_many_attached :images
end
