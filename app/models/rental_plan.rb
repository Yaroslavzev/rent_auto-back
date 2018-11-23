# app/models/rental_plan.rb
class RentalPlan < ApplicationRecord
  belongs_to :model
  belongs_to :model_class
  belongs_to :rental_type
  belongs_to :rental_rate
  belongs_to :rental_price

  has_many :orders, dependent: :nullify
end
